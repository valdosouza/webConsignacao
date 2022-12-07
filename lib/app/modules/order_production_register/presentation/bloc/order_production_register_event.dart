import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';

abstract class OrderProductionEvent {}

class OrderProductionGetListEvent extends OrderProductionEvent {}

class OrderProductionGetProductsEvent extends OrderProductionEvent {
  final int tbInstitutionId;
  OrderProductionGetProductsEvent({required this.tbInstitutionId});
}

class OrderProductionGetStocksEvent extends OrderProductionEvent {
  final int tbInstitutionId;
  OrderProductionGetStocksEvent({required this.tbInstitutionId});
}

class OrderProductionSearchProductsEvent extends OrderProductionEvent {
  final int id;
  OrderProductionSearchProductsEvent({required this.id});
}

class OrderProductionSearchStocksEvent extends OrderProductionEvent {
  final int id;
  OrderProductionSearchStocksEvent({required this.id});
}

class OrderProductionSearchEvent extends OrderProductionEvent {
  String search;

  OrderProductionSearchEvent({
    required this.search,
  });
}

class OrderProductionPutEvent extends OrderProductionEvent {
  final OrderProductionRegisterModel model;

  OrderProductionPutEvent({required this.model});
}

class OrderProductionPostEvent extends OrderProductionEvent {
  final OrderProductionRegisterModel model;

  OrderProductionPostEvent({required this.model});
}

class OrderProductionDeleteEvent extends OrderProductionEvent {
  final OrderProductionRegisterModel model;

  OrderProductionDeleteEvent({required this.model});
}

class OrderProductionInfoEvent extends OrderProductionEvent {
  final OrderProductionRegisterModel? model;
  OrderProductionInfoEvent({this.model});
}
