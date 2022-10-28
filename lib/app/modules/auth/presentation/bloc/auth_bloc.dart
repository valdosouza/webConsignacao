import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_recovery_password_model.dart';
import 'package:appweb/app/modules/auth/domain/usecase/change_password.dart';
import 'package:appweb/app/modules/auth/domain/usecase/login_email.dart';
import 'package:appweb/app/modules/auth/domain/usecase/recovery_password.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_event.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginEmail loginEmail;
  final RecoveryPassword recovery;
  final ChangePassword change;

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

  login() async {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await loginEmail(
          Params(username: event.login, password: event.password));
      final SharedPreferences sp = await SharedPreferences.getInstance();

      result.fold((l) => const AuthErrorState('Erro ao realizar Login'),
          (authResponse) async {
        final AuthModel authModel = authResponse;
        final bool auth = authModel.jwt.compareTo("") != 0;
        sp.setString('token', authModel.jwt);
        sp.setString('institution', authModel.institution.toString());
        if (auth) {
          emit(AuthSuccessState());
        } else {
          emit(const AuthErrorState('Login ou senha inválido'));
        }
      });
    });
  }

  logout() async {
    on<AuthLogoutEvent>((event, emit) async {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('token', '');
      await Modular.to.popAndPushNamed('/');
      emit(AuthLogoutSucessState());
    });
  }

  recoveryPassword() async {
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

  changePassword() async {
    on<AuthChangeEvent>((event, emit) async {
      emit(AuthLoadingState());

      final response = await change.call(ParamsChange(model: event.model));

      var result = response.fold(
          (l) => AuthChangeErrorState(), (r) => AuthChangeSuccessState());
      emit(result);
    });
  }
}
