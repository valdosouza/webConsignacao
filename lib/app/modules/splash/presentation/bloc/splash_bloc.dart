import 'package:bloc/bloc.dart';

import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/modules/splash/domain/usecase/get_authorization.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_event.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetAuthorization getAuthorization;
  SplashBloc({
    required this.getAuthorization,
  }) : super(SplashInitState()) {
    loggedSate();
  }

  loggedSate() {
    on<SplashInitEvent>((event, emit) async {
      emit(SplahsLoadingState());

      final token = await LocalStorageService.instance
          .get(key: LocalStorageKey.token, defaultValue: '');
      final keepConnected = await LocalStorageService.instance
          .get(key: LocalStorageKey.keepConnected, defaultValue: false);

      final bool result =
          token.toString().compareTo("") != 0 && keepConnected == 'true';
      if (result) {
        var response = await getAuthorization.call(ParamsAuthorization());

        var result = response.fold((l) {
          return SplashLoggedState(logged: false);
        }, (r) {
          return SplashLoggedState(logged: r);
        });
        emit(result);
      } else {
        emit(SplashLoggedState(logged: false));
      }
    });
  }
}
