import 'package:equatable/equatable.dart';

abstract class UserRegisterSate extends Equatable {
  const UserRegisterSate();
}

class UserRegisterInitial extends UserRegisterSate {
  @override
  List<Object> get props => [];
}

class UserRegisterLoadingState extends UserRegisterSate {
  @override
  List<Object> get props => [];
}

class UserRegisterLoadedState extends UserRegisterSate {
  @override
  List<Object> get props => [];
}

class UserRegisterSuccessState extends UserRegisterSate {
  @override
  List<Object> get props => [];
}

class UserRegisterLogoutState extends UserRegisterSate {
  @override
  List<Object> get props => [];
}

class UserRegisterErrorState extends UserRegisterSate {
  final String error;

  const UserRegisterErrorState(this.error);

  @override
  List<Object> get props => [error];
}
