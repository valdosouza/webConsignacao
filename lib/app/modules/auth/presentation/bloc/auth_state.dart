part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthLogoutSucessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  const AuthErrorState(this.error);
}
