import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';

abstract class OrderProductionRegisterEvent {}

class OrderProductionGetListEvent extends OrderProductionRegisterEvent {}

class OrderProductionGetProductsEvent extends OrderProductionRegisterEvent {
  final int tbInstitutionId;
  OrderProductionGetProductsEvent({required this.tbInstitutionId});
}

class OrderProductionGetStocksEvent extends OrderProductionRegisterEvent {
  final int tbInstitutionId;
  OrderProductionGetStocksEvent({required this.tbInstitutionId});
}

class OrderProductionSearchProductsEvent extends OrderProductionRegisterEvent {
  final int id;
  OrderProductionSearchProductsEvent({required this.id});
}

class OrderProductionSearchStocksEvent extends OrderProductionRegisterEvent {
  final int id;
  OrderProductionSearchStocksEvent({required this.id});
}

class OrderProductionSearchEvent extends OrderProductionRegisterEvent {
  String search;

  OrderProductionSearchEvent({
    required this.search,
  });
}

class OrderProductionPutEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel model;

  OrderProductionPutEvent({required this.model});
}

class OrderProductionPostEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel model;

  OrderProductionPostEvent({required this.model});
}

class OrderProductionDeleteEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel model;

  OrderProductionDeleteEvent({required this.model});
}

class OrderProductionInfoEvent extends OrderProductionRegisterEvent {
  final OrderProductionRegisterModel? model;
  OrderProductionInfoEvent({this.model});
}
