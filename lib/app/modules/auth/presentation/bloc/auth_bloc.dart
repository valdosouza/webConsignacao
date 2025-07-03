import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/modules/auth/data/model/auth_recovery_password_model.dart';
import 'package:appweb/app/modules/auth/domain/usecase/change_password.dart';
import 'package:appweb/app/modules/auth/domain/usecase/login_email.dart';
import 'package:appweb/app/modules/auth/domain/usecase/recovery_password.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_event.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginEmail loginEmail;
  final RecoveryPassword recovery;
  final ChangePassword change;

  bool _keepConnected = false;

  set setKeepConnected(bool value) {
    _keepConnected = value;
  }

  bool get keepConnected => _keepConnected;

  AuthRecoveryPasswordModel recoveryModel = AuthRecoveryPasswordModel.empty();
  AuthBloc({
    required this.loginEmail,
    required this.recovery,
    required this.change,
  }) : super(AuthInitial()) {
    login();
    logout();
    recoveryPassword();
    changePassword();
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'versionSecurityPatch': build.version.securityPatch,
      'versionSdkInt': build.version.sdkInt,
      'versionRelease': build.version.release,
      'versionPreviewSdkInt': build.version.previewSdkInt,
      'versionIncremental': build.version.incremental,
      'versionCodename': build.version.codename,
      'versionBaseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
          ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  Future<void> login() async {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      var status = PermissionStatus.granted;
      Map<String, dynamic> deviceData = <String, dynamic>{};
      if (!kIsWeb) {
        final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        if (int.parse(deviceData['versionRelease']) <= 10) {
          status = await Permission.storage.request();
        }
      }
      LocalStorageService.instance.saveItem(
        key: LocalStorageKey.token,
        value: "",
      );
      final result = await loginEmail(
          Params(username: event.login, password: event.password));

      var response = result.fold((l) {
        AuthErrorState(error: l.toString());
      }, (r) {
        if ((status == PermissionStatus.granted) ||
            (int.parse(deviceData['versionRelease']) > 10)) {
          final bool auth = r.auth;
          if (auth) {
            LocalStorageService.instance.saveItem(
              key: LocalStorageKey.token,
              value: r.jwt,
            );
            LocalStorageService.instance.saveItem(
              key: LocalStorageKey.tbInstitutionId,
              value: r.tbInstitutionId,
            );
            LocalStorageService.instance.saveItem(
              key: LocalStorageKey.tbUserId,
              value: r.id,
            );
            LocalStorageService.instance.saveItem(
              key: LocalStorageKey.userName,
              value: r.username,
            );
            return AuthSuccessState();
          } else {
            return AuthErrorState(error: r.error);
          }
        } else if (status == PermissionStatus.denied) {
          return const AuthErrorState(error: 'Permissão negada.');
        } else if (status == PermissionStatus.permanentlyDenied) {
          return const AuthErrorState(error: 'Permissão negada.');
        }
      });
      emit(response!);
    });
  }

  Future<void> logout() async {
    on<AuthLogoutEvent>((event, emit) async {
      LocalStorageService.instance.saveItem(
        key: LocalStorageKey.token,
        value: '',
      );
      await LocalStorageService.instance
          .saveItem(key: LocalStorageKey.keepConnected, value: false);
      await Modular.to.popAndPushNamed('/');
      emit(AuthLogoutSucessState());
    });
  }

  Future<void> recoveryPassword() async {
    on<AuthRecoveryEvent>((event, emit) async {
      emit(AuthLoadingState());

      final response = await recovery.call(ParamsRecovery(email: event.email));

      var result = response.fold((l) => AuthRecoveryErrorState(), (r) {
        recoveryModel = r;
        return AuthRecoverySuccessState();
      });
      emit(result);
    });
  }

  Future<void> changePassword() async {
    on<AuthChangeEvent>((event, emit) async {
      emit(AuthLoadingState());

      final response = await change.call(ParamsChange(model: event.model));

      var result = response.fold(
          (l) => AuthChangeErrorState(), (r) => AuthChangeSuccessState());
      emit(result);
    });
  }
}
