import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';

abstract class OrderProductionState {
  List<OrderProductionRegisterModel> list;

  OrderProductionState({
    required this.list,
  });
}

class OrderProductionLoadingState extends OrderProductionState {
  OrderProductionLoadingState() : super(list: []);
}

class OrderProductionLoadedState extends OrderProductionState {
  OrderProductionLoadedState({required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionErrorState extends OrderProductionState {
  OrderProductionErrorState({required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionInfoPageState extends OrderProductionState {
  final OrderProductionRegisterModel? model;
  OrderProductionInfoPageState(
      {required List<OrderProductionRegisterModel> list, this.model})
      : super(list: list);
}

class OrderProductionGetErrorState extends OrderProductionState {
  OrderProductionGetErrorState({required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionPostSuccessState extends OrderProductionState {
  OrderProductionPostSuccessState({required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionPostErrorState extends OrderProductionState {
  OrderProductionPostErrorState({required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionPutSuccessState extends OrderProductionState {
  OrderProductionPutSuccessState({required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionPutErrorState extends OrderProductionState {
  OrderProductionPutErrorState({required List<OrderProductionRegisterModel> list})
      : super(list: list);
}
