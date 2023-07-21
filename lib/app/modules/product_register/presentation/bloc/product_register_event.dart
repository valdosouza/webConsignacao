abstract class ProductRegisterEvent {}

class ProductRegisterGetListEvent extends ProductRegisterEvent {}

class ProductRegisterSearchEvent extends ProductRegisterEvent {
  String search;

  ProductRegisterSearchEvent({
    required this.search,
  });
}

class ProductRegisterPutEvent extends ProductRegisterEvent {
  ProductRegisterPutEvent();
}

class ProductRegisterPostEvent extends ProductRegisterEvent {
  ProductRegisterPostEvent();
}

class ProductRegisterAddEvent extends ProductRegisterEvent {
  ProductRegisterAddEvent();
}

class ProductRegisterEditEvent extends ProductRegisterEvent {
  ProductRegisterEditEvent();
}
