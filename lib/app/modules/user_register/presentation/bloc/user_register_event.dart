abstract class UserRegisterEvent {}

class UserRegisterGetListEvent extends UserRegisterEvent {}

class UserRegisterSearchEvent extends UserRegisterEvent {
  String search;

  UserRegisterSearchEvent({required this.search});
}
