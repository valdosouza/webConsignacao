import 'package:appweb/app/modules/auth/data/model/auth_change_password_model.dart';

abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String login;
  final String password;

  AuthLoginEvent({required this.login, required this.password});
}

class AuthLogoutEvent extends AuthEvent {}

class AuthRecoveryEvent extends AuthEvent {
  final String email;

  AuthRecoveryEvent({required this.email});
}

class AuthChangeEvent extends AuthEvent {
  final AuthChangePasswordModel model;

  AuthChangeEvent({required this.model});
}

class AuthVerifyAuthorizationEvent extends AuthEvent {
  final String token;
  AuthVerifyAuthorizationEvent({
    required this.token,
  });
}
