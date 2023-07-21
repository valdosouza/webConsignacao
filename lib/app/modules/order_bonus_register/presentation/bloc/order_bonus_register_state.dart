import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_items_model.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';

abstract class OrderBonusRegisterState {
  List<OrderBonusRegisterModel> list;

  OrderBonusRegisterState({
    required this.list,
  });
}

class OrderBonusRegisterLoadingState extends OrderBonusRegisterState {
  OrderBonusRegisterLoadingState() : super(list: []);
}

class OrderBonusRegisterLoadedState extends OrderBonusRegisterState {
  OrderBonusRegisterLoadedState({required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderBonusRegisterErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterErrorState({required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderBonusRegisterInfoPageState extends OrderBonusRegisterState {
  final OrderBonusRegisterModel? model;
  final int tabIndex;
  OrderBonusRegisterInfoPageState(
      {required this.tabIndex,
      required List<OrderBonusRegisterModel> list,
      this.model})
      : super(list: list);
}

class OrderBonusRegisterGetErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterGetErrorState({required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderBonusRegisterPostSuccessState extends OrderBonusRegisterState {
  OrderBonusRegisterPostSuccessState(
      {required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderBonusRegisterPostErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterPostErrorState(
      {required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderBonusRegisterPutSuccessState extends OrderBonusRegisterState {
  OrderBonusRegisterPutSuccessState(
      {required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderBonusRegisterPutErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterPutErrorState({required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderBonusRegisterDeleteSuccessState extends OrderBonusRegisterState {
  OrderBonusRegisterDeleteSuccessState(
      {required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderBonusRegisterDeleteErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterDeleteErrorState(
      {required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderClosureSuccessState extends OrderBonusRegisterState {
  final String result;
  OrderClosureSuccessState(
      {required this.result, required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderReopenSuccessState extends OrderBonusRegisterState {
  final String result;
  OrderReopenSuccessState(
      {required this.result, required List<OrderBonusRegisterModel> list})
      : super(list: list);
}

class OrderBonusRegisterProductSuccessState extends OrderBonusRegisterState {
  final List<ProductListModel> products;
  OrderBonusRegisterProductSuccessState({required this.products})
      : super(list: []);
}

class OrderBonusRegisterProductErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterProductErrorState() : super(list: []);
}

class OrderBonusRegisterEntitySuccessState extends OrderBonusRegisterState {
  final List<EntityListModel> entity;
  OrderBonusRegisterEntitySuccessState({required this.entity})
      : super(list: []);
}

class OrderBonusRegisterEntityErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterEntityErrorState() : super(list: []);
}

class OrderBonusRegisterStockSuccessState extends OrderBonusRegisterState {
  final List<StockListModel> stock;
  OrderBonusRegisterStockSuccessState({required this.stock}) : super(list: []);
}

class OrderBonusRegisterStockErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterStockErrorState() : super(list: []);
}

class OrderBonusRegisterItemPage extends OrderBonusRegisterState {
  final OrderBonusRegisterItemsModel item;
  OrderBonusRegisterItemPage({required this.item}) : super(list: []);
}

class OrderBonusRegisterChangeDirectionErrorState
    extends OrderBonusRegisterState {
  OrderBonusRegisterChangeDirectionErrorState() : super(list: []);
}

class OrderBonusRegisterChangeDirectionkSuccessState
    extends OrderBonusRegisterState {
  OrderBonusRegisterChangeDirectionkSuccessState() : super(list: []);
}

//======================MASTER - Errors============================

class OrderClosureErrorState extends OrderBonusRegisterState {
  OrderClosureErrorState({required super.list});
}

class OrderReopenErrorState extends OrderBonusRegisterState {
  OrderReopenErrorState({required super.list});
}
