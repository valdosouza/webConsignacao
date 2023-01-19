abstract class PriceListRegisterEvent {}

class PriceListRegisterGetListEvent extends PriceListRegisterEvent {}

class PriceListRegisterSearchEvent extends PriceListRegisterEvent {
  String search;

  PriceListRegisterSearchEvent({
    required this.search,
  });
}

class PriceListRegisterPutEvent extends PriceListRegisterEvent {
  PriceListRegisterPutEvent();
}

class PriceListRegisterPostEvent extends PriceListRegisterEvent {
  PriceListRegisterPostEvent();
}

class PriceListRegisterAddEvent extends PriceListRegisterEvent {
  PriceListRegisterAddEvent();
}

class PriceListRegisterEditEvent extends PriceListRegisterEvent {
  PriceListRegisterEditEvent();
}
