abstract class CustomerRegisterEvent {}

class CustomerRegisterGetListEvent extends CustomerRegisterEvent {}

class CustomerRegisterSearchEvent extends CustomerRegisterEvent {
  String search;

  CustomerRegisterSearchEvent({required this.search});
}
