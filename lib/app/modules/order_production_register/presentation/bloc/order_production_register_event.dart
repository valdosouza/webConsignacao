import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';

abstract class OrderProductionRegisterEvent {}

class OrderProductionRegisterGetListEvent extends OrderProductionRegisterEvent {
}

class OrderProductionRegisterSearchEvent extends OrderProductionRegisterEvent {
  String search;

  OrderProductionRegisterSearchEvent({
    required this.search,
  });
}

class OrderProductionRegisterPutEvent extends OrderProductionRegisterEvent {
  final OrderProductionModel model;

  OrderProductionRegisterPutEvent({required this.model});
}

class OrderProductionRegisterPostEvent extends OrderProductionRegisterEvent {
  final OrderProductionModel model;

  OrderProductionRegisterPostEvent({required this.model});
}

class OrderProductionRegisterInfoEvent extends OrderProductionRegisterEvent {
  final OrderProductionModel? model;
  OrderProductionRegisterInfoEvent({this.model});
}
