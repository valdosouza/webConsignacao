import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
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
  AuthBloc({
    required this.loginEmail,
    required this.recovery,
  }) : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await loginEmail(
          Params(username: event.login, password: event.password));

      result.fold((l) => const AuthErrorState('Erro ao realizar Login'),
          (authResponse) async {
        final SharedPreferences sp = await SharedPreferences.getInstance();
        final AuthModel authModel = authResponse;
        final bool auth = authModel.jwt.compareTo("") != 0;
        await sp.setString('token', authModel.jwt);
        await sp.setString('institution', authModel.institution.toString());
        if (auth) {
          emit(AuthSuccessState());
        } else {
          emit(const AuthErrorState('Login ou senha inválido'));
        }
      });
    });

    on<AuthLogoutEvent>((event, emit) async {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('token', '');
      await Modular.to.popAndPushNamed('/');
      emit(AuthLogoutSucessState());
    });

    on<AuthRecoveryEvent>((event, emit) async {
      emit(AuthLoadingState());

      final response = await recovery.call(ParamsRecovery(email: event.email));

      var result = response.fold(
          (l) => AuthRecoveryErrorState(), (r) => AuthRecoverySuccessState());
      emit(result);
    });
  }
}
