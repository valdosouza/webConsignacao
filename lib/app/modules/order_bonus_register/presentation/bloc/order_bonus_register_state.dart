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
  OrderBonusRegisterLoadedState({required super.list});
}

class OrderBonusRegisterErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterErrorState({required super.list});
}

class OrderBonusRegisterInfoPageState extends OrderBonusRegisterState {
  final OrderBonusRegisterModel? model;
  final int tabIndex;
  OrderBonusRegisterInfoPageState(
      {required this.tabIndex, required super.list, this.model});
}

class OrderBonusRegisterGetErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterGetErrorState({required super.list});
}

class OrderBonusRegisterPostSuccessState extends OrderBonusRegisterState {
  OrderBonusRegisterPostSuccessState({required super.list});
}

class OrderBonusRegisterPostErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterPostErrorState({required super.list});
}

class OrderBonusRegisterPutSuccessState extends OrderBonusRegisterState {
  OrderBonusRegisterPutSuccessState({required super.list});
}

class OrderBonusRegisterPutErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterPutErrorState({required super.list});
}

class OrderBonusRegisterDeleteSuccessState extends OrderBonusRegisterState {
  OrderBonusRegisterDeleteSuccessState({required super.list});
}

class OrderBonusRegisterDeleteErrorState extends OrderBonusRegisterState {
  OrderBonusRegisterDeleteErrorState({required super.list});
}

class OrderClosureSuccessState extends OrderBonusRegisterState {
  final String result;
  OrderClosureSuccessState({required this.result, required super.list});
}

class OrderReopenSuccessState extends OrderBonusRegisterState {
  final String result;
  OrderReopenSuccessState({required this.result, required super.list});
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
