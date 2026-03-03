import 'package:appweb/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_event.dart';
import 'package:bloc/bloc.dart';

/// Fake bloc for widget tests. Emits configurable states; assignable to `Bloc<AuthEvent, AuthState>`.
class FakeAuthBloc extends Bloc<AuthEvent, AuthState> {
  FakeAuthBloc({AuthState? initialState}) : super(initialState ?? AuthInitial()) {
    on<AuthLoginEvent>((_, __) {}); // No-op so tap login does not throw
  }

  void emitState(AuthState state) => emit(state);
}
