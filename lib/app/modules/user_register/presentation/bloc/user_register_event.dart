import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';

abstract class UserRegisterEvent {}

class UserRegisterGetListEvent extends UserRegisterEvent {}

class UserRegisterSearchEvent extends UserRegisterEvent {
  String search;

  UserRegisterSearchEvent({required this.search});
}

class UserRegisterInfoEvent extends UserRegisterEvent {
  final UserRegisterModel? model;
  UserRegisterInfoEvent({this.model});
}

class UserRegisterAddEvent extends UserRegisterEvent {
  final UserRegisterModel model;

  UserRegisterAddEvent({required this.model});
}

class UserRegisterEditEvent extends UserRegisterEvent {
  final int id;

  UserRegisterEditEvent({required this.id});
}

class UserRegisterDeleteEvent extends UserRegisterEvent {
  final int id;

  UserRegisterDeleteEvent({required this.id});
}
