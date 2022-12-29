import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_event.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_state.dart';
import 'package:bloc/bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitState()) {
    loggedSate();
  }

  loggedSate() {
    on<SplashInitEvent>((event, emit) async {
      final token = await LocalStorageService.instance
          .get(key: LocalStorageKey.token, defaultValue: '');
      final keepConnected = await LocalStorageService.instance
          .get(key: LocalStorageKey.keepConnected, defaultValue: false);

      final bool result =
          token.toString().compareTo("") != 0 && keepConnected == 'true';
      emit(SplashLoggedState(logged: result));
    });
  }
}
