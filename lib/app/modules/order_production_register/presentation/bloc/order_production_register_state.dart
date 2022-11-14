import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';

abstract class OrderProductionRegisterState {
  List<OrderProductionModel> list;

  OrderProductionRegisterState({
    required this.list,
  });
}

class OrderProductionRegisterLoadingState extends OrderProductionRegisterState {
  OrderProductionRegisterLoadingState() : super(list: []);
}

class OrderProductionRegisterLoadedState extends OrderProductionRegisterState {
  OrderProductionRegisterLoadedState({required List<OrderProductionModel> list})
      : super(list: list);
}

class OrderProductionRegisterErrorState extends OrderProductionRegisterState {
  OrderProductionRegisterErrorState({required List<OrderProductionModel> list})
      : super(list: list);
}

class OrderProductionRegisterInfoPageState
    extends OrderProductionRegisterState {
  final OrderProductionModel? model;
  OrderProductionRegisterInfoPageState(
      {required List<OrderProductionModel> list, this.model})
      : super(list: list);
}

class OrderProductionRegisterGetErrorState
    extends OrderProductionRegisterState {
  OrderProductionRegisterGetErrorState(
      {required List<OrderProductionModel> list})
      : super(list: list);
}

class OrderProductionRegisterPostSuccessState
    extends OrderProductionRegisterState {
  OrderProductionRegisterPostSuccessState(
      {required List<OrderProductionModel> list})
      : super(list: list);
}

class OrderProductionRegisterPostErrorState
    extends OrderProductionRegisterState {
  OrderProductionRegisterPostErrorState(
      {required List<OrderProductionModel> list})
      : super(list: list);
}

class OrderProductionRegisterPutSuccessState
    extends OrderProductionRegisterState {
  OrderProductionRegisterPutSuccessState(
      {required List<OrderProductionModel> list})
      : super(list: list);
}

class OrderProductionRegisterPutErrorState
    extends OrderProductionRegisterState {
  OrderProductionRegisterPutErrorState(
      {required List<OrderProductionModel> list})
      : super(list: list);
}
