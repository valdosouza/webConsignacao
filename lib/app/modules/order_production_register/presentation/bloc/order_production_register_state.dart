import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/stock_list_model.dart';

abstract class OrderProductionRegisterState {
  List<OrderProductionRegisterModel> list;

  OrderProductionRegisterState({
    required this.list,
  });
}

class OrderProductionRegisterLoadingState extends OrderProductionRegisterState {
  OrderProductionRegisterLoadingState() : super(list: []);
}

class OrderProductionRegisterLoadedState extends OrderProductionRegisterState {
  OrderProductionRegisterLoadedState(
      {required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionRegisterErrorState extends OrderProductionRegisterState {
  OrderProductionRegisterErrorState(
      {required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionRegisterInfoPageState
    extends OrderProductionRegisterState {
  final OrderProductionRegisterModel? model;
  OrderProductionRegisterInfoPageState(
      {required List<OrderProductionRegisterModel> list, this.model})
      : super(list: list);
}

class OrderProductionRegisterGetErrorState
    extends OrderProductionRegisterState {
  OrderProductionRegisterGetErrorState(
      {required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionRegisterPostSuccessState
    extends OrderProductionRegisterState {
  OrderProductionRegisterPostSuccessState(
      {required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionRegisterPostErrorState
    extends OrderProductionRegisterState {
  OrderProductionRegisterPostErrorState(
      {required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionRegisterPutSuccessState
    extends OrderProductionRegisterState {
  OrderProductionRegisterPutSuccessState(
      {required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionRegisterPutErrorState
    extends OrderProductionRegisterState {
  OrderProductionRegisterPutErrorState(
      {required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionRegisterDeleteSuccessState
    extends OrderProductionRegisterState {
  OrderProductionRegisterDeleteSuccessState(
      {required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionRegisterDeleteErrorState
    extends OrderProductionRegisterState {
  OrderProductionRegisterDeleteErrorState(
      {required List<OrderProductionRegisterModel> list})
      : super(list: list);
}

class OrderProductionRegisterProductSuccessState
    extends OrderProductionRegisterState {
  final List<ProductModel> products;
  OrderProductionRegisterProductSuccessState({required this.products})
      : super(list: []);
}

class OrderProductionRegisterProductErrorState
    extends OrderProductionRegisterState {
  OrderProductionRegisterProductErrorState() : super(list: []);
}

class OrderProductionRegisterStockSuccessState
    extends OrderProductionRegisterState {
  final List<StockListModel> stock;
  OrderProductionRegisterStockSuccessState({required this.stock})
      : super(list: []);
}

class OrderProductionRegisterStockErrorState
    extends OrderProductionRegisterState {
  OrderProductionRegisterStockErrorState() : super(list: []);
}
