import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_getlist.dart';

abstract class UserRegisterEvent {}

class UserRegisterGetListEvent extends UserRegisterEvent {
  ParamsGetUser params;
  UserRegisterGetListEvent({
    required this.params,
  });
}

class UserRegisterSearchEvent extends UserRegisterEvent {
  ParamsGetUser params;

  UserRegisterSearchEvent({required this.params});
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
