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
  UserRegisterSuccessState() : super(users: []);
}

class UserRegisterLogoutState extends UserRegisterState {
  UserRegisterLogoutState() : super(users: []);
}

class UserRegisterErrorState extends UserRegisterState {
  UserRegisterErrorState() : super(users: []);
}
