import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';

abstract class UserRegisterEvent {}

class UserRegisterGetListEvent extends UserRegisterEvent {}

class UserRegisterSearchEvent extends UserRegisterEvent {
  String search;

  UserRegisterSearchEvent({required this.search});
}

class UserRegisterInfoEvent extends UserRegisterEvent {
  final UserRegisterModel model;
  UserRegisterInfoEvent({
    required this.model,
  });
}

class UserRegisterAddEvent extends UserRegisterEvent {}

class UserRegisterPostEvent extends UserRegisterEvent {
  final UserRegisterModel model;

  UserRegisterPostEvent({required this.model});
}

class UserRegisterPutEvent extends UserRegisterEvent {
  final UserRegisterModel model;

  UserRegisterPutEvent({required this.model});
}

class UserRegisterDeleteEvent extends UserRegisterEvent {
  final int id;

  UserRegisterDeleteEvent({required this.id});
}
