abstract class OrderProductionRegisterEvent {}

class OrderGetListEvent extends OrderProductionRegisterEvent {}

class OrderSearchEvent extends OrderProductionRegisterEvent {
  String search;
  OrderSearchEvent({required this.search});
}

class OrderReturnEvent extends OrderProductionRegisterEvent {
  OrderReturnEvent();
}

class OrderPutEvent extends OrderProductionRegisterEvent {
  OrderPutEvent();
}

class OrderPostEvent extends OrderProductionRegisterEvent {
  OrderPostEvent();
}

class OrderDeleteEvent extends OrderProductionRegisterEvent {
  OrderDeleteEvent();
}

class OrderAddEvent extends OrderProductionRegisterEvent {
  OrderAddEvent();
}

class OrderEditEvent extends OrderProductionRegisterEvent {
  OrderEditEvent();
}

//-----------------------Auxiliares-----------------------------------
class OrderGetProductsEvent extends OrderProductionRegisterEvent {
  OrderGetProductsEvent();
}

class OrderSearchProductsEvent extends OrderProductionRegisterEvent {
  final String search;
  OrderSearchProductsEvent({required this.search});
}

class OrderGetStocksEvent extends OrderProductionRegisterEvent {
  OrderGetStocksEvent();
}

class OrderSearchStocksEvent extends OrderProductionRegisterEvent {
  final String search;
  OrderSearchStocksEvent({required this.search});
}
