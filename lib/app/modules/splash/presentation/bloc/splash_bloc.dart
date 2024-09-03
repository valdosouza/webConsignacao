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
  }) : super(LoadingState()) {
    _getAuthorization();
  }

  _getAuthorization() {
    on<SplashInitEvent>((event, emit) async {
      emit(LoadingState());

      final token = await LocalStorageService.instance
          .get(key: LocalStorageKey.token, defaultValue: '');
      final keepConnected = await LocalStorageService.instance
          .get(key: LocalStorageKey.keepConnected, defaultValue: false);

      final bool result =
          (token.toString().compareTo("") != 0) && (keepConnected == 'true');
      if (result) {
        var response = await getAuthorization.call(ParamsAuthorization());

        var result = response.fold((l) {
          return NotAuthorizedState();
        }, (r) {
          if (r) {
            return AuthorizedState();
          } else {
            return NotAuthorizedState();
          }
        });
        emit(result);
      } else {
        emit(NotAuthorizedState());
      }
    });
  }
}
