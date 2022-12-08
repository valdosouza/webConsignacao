
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';

abstract class OrderProductionRegisterEvent {}

class OrderProductionRegisterGetListEvent extends OrderProductionRegisterEvent {}

class OrderProductionRegisterGetProductsEvent extends OrderProductionRegisterEvent {
  final int tbInstitutionId;
  OrderProductionRegisterGetProductsEvent({required this.tbInstitutionId});
}

class OrderProductionRegisterGetStocksEvent extends OrderProductionRegisterEvent {
  final int tbInstitutionId;
  OrderProductionRegisterGetStocksEvent({required this.tbInstitutionId});
}

class OrderProductionRegisterSearchProductsEvent extends OrderProductionRegisterEvent {
  final int id;
  OrderProductionRegisterSearchProductsEvent({required this.id});
}

class OrderProductionRegisterSearchStocksEvent extends OrderProductionRegisterEvent {
  final int id;
  OrderProductionRegisterSearchStocksEvent({required this.id});
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

class OrderProductionRegisterInfoEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel? model;
  OrderProductionRegisterInfoEvent({this.model});
}
