import 'package:appweb/app/modules/splash/presentation/bloc/splash_bloc.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_event.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_state.dart';
import 'package:bloc/bloc.dart';

/// Fake [SplashBloc] for widget tests.
class FakeSplashBloc extends Bloc<SplashEvent, SplashState> {
  FakeSplashBloc({SplashState? initialState})
      : super(initialState ?? LoadingState()) {
    on<SplashInitEvent>((_, __) {});
  }

  void emitState(SplashState state) => emit(state);
}
