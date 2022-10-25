abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String login;
  final String password;

  AuthLoginEvent({required this.login, required this.password});
}

class AuthLogoutEvent extends AuthEvent {}
