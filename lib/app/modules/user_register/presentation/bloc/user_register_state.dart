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
    required super.users,
  });
}

class UserRegisterSuccessState extends UserRegisterState {
  UserRegisterSuccessState({
    required super.users,
  });
}

class UserRegisterLogoutState extends UserRegisterState {
  UserRegisterLogoutState() : super(users: []);
}

class UserRegisterErrorState extends UserRegisterState {
  UserRegisterErrorState() : super(users: []);
}

class UserRegisterAddErrorState extends UserRegisterState {
  UserRegisterAddErrorState({
    required super.users,
  });
}

class UserRegisterEditErrorState extends UserRegisterState {
  UserRegisterEditErrorState({
    required super.users,
  });
}

class UserRegisterEditSuccessState extends UserRegisterState {
  UserRegisterEditSuccessState({
    required super.users,
  });
}

class UserRegisterInfoPageState extends UserRegisterState {
  UserRegisterInfoPageState({required super.users});
}

class UserRegisterDeleteErrorState extends UserRegisterState {
  UserRegisterDeleteErrorState({
    required super.users,
  });
}

class UserRegisterDeleteSuccessState extends UserRegisterState {
  UserRegisterDeleteSuccessState({
    required super.users,
  });
}
