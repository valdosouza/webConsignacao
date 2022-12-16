import 'package:appweb/app/modules/Core/data/model/entity_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/stock_list_model.dart';

abstract class OrderStockAdjustmentRegisterState {
  List<OrderStockAdjustmentRegisterModel> list;

  OrderStockAdjustmentRegisterState({
    required this.list,
  });
}

class OrderStockAdjustmentRegisterLoadingState extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterLoadingState() : super(list: []);
}

class OrderStockAdjustmentRegisterLoadedState extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterLoadedState(
      {required List<OrderStockAdjustmentRegisterModel> list})
      : super(list: list);
}

class OrderStockAdjustmentRegisterErrorState extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterErrorState(
      {required List<OrderStockAdjustmentRegisterModel> list})
      : super(list: list);
}

class OrderStockAdjustmentRegisterInfoPageState
    extends OrderStockAdjustmentRegisterState {
  final OrderStockAdjustmentRegisterModel? model;
  OrderStockAdjustmentRegisterInfoPageState(
      {required List<OrderStockAdjustmentRegisterModel> list, this.model})
      : super(list: list);
}

class OrderStockAdjustmentRegisterGetErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterGetErrorState(
      {required List<OrderStockAdjustmentRegisterModel> list})
      : super(list: list);
}

class OrderStockAdjustmentRegisterPostSuccessState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterPostSuccessState(
      {required List<OrderStockAdjustmentRegisterModel> list})
      : super(list: list);
}

class OrderStockAdjustmentRegisterPostErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterPostErrorState(
      {required List<OrderStockAdjustmentRegisterModel> list})
      : super(list: list);
}

class OrderStockAdjustmentRegisterPutSuccessState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterPutSuccessState(
      {required List<OrderStockAdjustmentRegisterModel> list})
      : super(list: list);
}

class OrderStockAdjustmentRegisterPutErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterPutErrorState(
      {required List<OrderStockAdjustmentRegisterModel> list})
      : super(list: list);
}

class OrderStockAdjustmentRegisterDeleteSuccessState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterDeleteSuccessState(
      {required List<OrderStockAdjustmentRegisterModel> list})
      : super(list: list);
}

class OrderStockAdjustmentRegisterDeleteErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterDeleteErrorState(
      {required List<OrderStockAdjustmentRegisterModel> list})
      : super(list: list);
}

class OrderStockAdjustmentRegisterProductSuccessState
    extends OrderStockAdjustmentRegisterState {
  final List<ProductModel> products;
  OrderStockAdjustmentRegisterProductSuccessState({required this.products})
      : super(list: []);
}

class OrderStockAdjustmentRegisterProductErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterProductErrorState() : super(list: []);
}

class OrderStockAdjustmentRegisterEntitySuccessState
    extends OrderStockAdjustmentRegisterState {
  final List<EntityModel> entity;
  OrderStockAdjustmentRegisterEntitySuccessState({required this.entity})
      : super(list: []);
}

class OrderStockAdjustmentRegisterEntityErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterEntityErrorState() : super(list: []);
}

class OrderStockAdjustmentRegisterStockSuccessState
    extends OrderStockAdjustmentRegisterState {
  final List<StockListModel> stock;
  OrderStockAdjustmentRegisterStockSuccessState({required this.stock})
      : super(list: []);
}

class OrderStockAdjustmentRegisterStockErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterStockErrorState() : super(list: []);
}
