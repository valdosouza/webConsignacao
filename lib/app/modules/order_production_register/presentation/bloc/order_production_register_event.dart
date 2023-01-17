import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';

abstract class OrderProductionRegisterEvent {}

class OrderProductionRegisterGetListEvent extends OrderProductionRegisterEvent {
}

class OrderProductionRegisterGetProductsEvent
    extends OrderProductionRegisterEvent {
  OrderProductionRegisterGetProductsEvent();
}

class OrderProductionRegisterGetStocksEvent
    extends OrderProductionRegisterEvent {
  OrderProductionRegisterGetStocksEvent();
}

class OrderProductionRegisterSearchProductsEvent
    extends OrderProductionRegisterEvent {
  final String search;
  OrderProductionRegisterSearchProductsEvent({required this.search});
}

class OrderProductionRegisterSearchStocksEvent
    extends OrderProductionRegisterEvent {
  final String search;
  OrderProductionRegisterSearchStocksEvent({required this.search});
}

class OrderProductionRegisterSearchEvent extends OrderProductionRegisterEvent {
  String search;
  OrderProductionRegisterSearchEvent({
    required this.search,
  });
}

class OrderProductionRegisterPutEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel model;

  OrderProductionRegisterPutEvent({required this.model});
}

class OrderProductionRegisterPostEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel model;

  OrderProductionRegisterPostEvent({required this.model});
}

class OrderProductionRegisterDeleteEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel model;

  OrderProductionRegisterDeleteEvent({required this.model});
}

class OrderProductionRegisterDesktopEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel? model;
  OrderProductionRegisterDesktopEvent({this.model});
}

class OrderProductionRegisterMobileEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel? model;
  OrderProductionRegisterMobileEvent({this.model});
}

class OrderProductionRegisterReturnEvent extends OrderProductionRegisterEvent {
  OrderProductionRegisterReturnEvent();
}
