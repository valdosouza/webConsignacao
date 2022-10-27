import 'package:appweb/app/modules/splash/presentation/bloc/splash_event.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_state.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitState()) {
    loggedSate();
  }

  loggedSate() {
    on<SplashInitEvent>((event, emit) async {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final String token = sp.getString('token').toString();
      final bool result = token.compareTo("") != 0;
      emit(SplashLoggedState(logged: result));
    });
  }
}
