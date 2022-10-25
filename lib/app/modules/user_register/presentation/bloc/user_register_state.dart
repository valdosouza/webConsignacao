import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';

abstract class UserRegisterState {
  List<UserRegisterModel> users;

  UserRegisterState({
    required this.users,
  });
}

class UserRegisterLoadingState extends UserRegisterState {
  UserRegisterLoadingState() : super(users: []);
}

class UserRegisterLoadedState extends UserRegisterState {
  UserRegisterLoadedState({
    required List<UserRegisterModel> users,
  }) : super(users: users);
}

class UserRegisterSuccessState extends UserRegisterState {
  UserRegisterSuccessState({
    required List<UserRegisterModel> users,
  }) : super(users: users);
}

class UserRegisterLogoutState extends UserRegisterState {
  UserRegisterLogoutState() : super(users: []);
}

class UserRegisterErrorState extends UserRegisterState {
  UserRegisterErrorState() : super(users: []);
}

class UserRegisterAddErrorState extends UserRegisterState {
  UserRegisterAddErrorState({
    required List<UserRegisterModel> users,
  }) : super(users: users);
}

class UserRegisterEditErrorState extends UserRegisterState {
  UserRegisterEditErrorState({
    required List<UserRegisterModel> users,
  }) : super(users: users);
}

class UserRegisterEditSuccessState extends UserRegisterState {
  UserRegisterEditSuccessState({
    required List<UserRegisterModel> users,
  }) : super(users: users);
}

class UserRegisterInfoPageState extends UserRegisterState {
  final UserRegisterModel? model;
  UserRegisterInfoPageState(
      {required List<UserRegisterModel> users, this.model})
      : super(users: users);
}

class UserRegisterDeleteErrorState extends UserRegisterState {
  UserRegisterDeleteErrorState({
    required List<UserRegisterModel> users,
  }) : super(users: users);
}

class UserRegisterDeleteSuccessState extends UserRegisterState {
  UserRegisterDeleteSuccessState({
    required List<UserRegisterModel> users,
  }) : super(users: users);
}
