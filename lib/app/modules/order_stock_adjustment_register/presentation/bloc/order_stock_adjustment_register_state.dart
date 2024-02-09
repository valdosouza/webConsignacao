import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';

abstract class OrderStockAdjustmentRegisterState {
  List<OrderStockAdjustmentRegisterModel> list;

  OrderStockAdjustmentRegisterState({
    required this.list,
  });
}

class OrderStockAdjustmentRegisterLoadingState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterLoadingState() : super(list: []);
}

class OrderStockAdjustmentRegisterLoadedState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterLoadedState({required super.list});
}

class OrderStockAdjustmentRegisterErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterErrorState({required super.list});
}

class OrderStockAdjustmentRegisterInfoPageState
    extends OrderStockAdjustmentRegisterState {
  final OrderStockAdjustmentRegisterModel? model;
  final int tabIndex;
  OrderStockAdjustmentRegisterInfoPageState(
      {required this.tabIndex, required super.list, this.model});
}

class OrderStockAdjustmentRegisterGetErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterGetErrorState({required super.list});
}

class OrderStockAdjustmentRegisterPostSuccessState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterPostSuccessState({required super.list});
}

class OrderStockAdjustmentRegisterPostErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterPostErrorState({required super.list});
}

class OrderStockAdjustmentRegisterPutSuccessState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterPutSuccessState({required super.list});
}

class OrderStockAdjustmentRegisterPutErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterPutErrorState({required super.list});
}

class OrderStockAdjustmentRegisterDeleteSuccessState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterDeleteSuccessState({required super.list});
}

class OrderStockAdjustmentRegisterDeleteErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterDeleteErrorState({required super.list});
}

class OrderClosureSuccessState extends OrderStockAdjustmentRegisterState {
  final String result;
  OrderClosureSuccessState({required this.result, required super.list});
}

class OrderReopenSuccessState extends OrderStockAdjustmentRegisterState {
  final String result;
  OrderReopenSuccessState({required this.result, required super.list});
}

class OrderStockAdjustmentRegisterProductSuccessState
    extends OrderStockAdjustmentRegisterState {
  final List<ProductListModel> products;
  OrderStockAdjustmentRegisterProductSuccessState({required this.products})
      : super(list: []);
}

class OrderStockAdjustmentRegisterProductErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterProductErrorState() : super(list: []);
}

class OrderStockAdjustmentRegisterEntitySuccessState
    extends OrderStockAdjustmentRegisterState {
  final List<EntityListModel> entity;
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

class OrderStockAdjustmentRegisterItemPage
    extends OrderStockAdjustmentRegisterState {
  final OrderStockAdjustmentRegisterItemsModel item;
  OrderStockAdjustmentRegisterItemPage({required this.item}) : super(list: []);
}

class OrderStockAdjustmentRegisterChangeDirectionErrorState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterChangeDirectionErrorState() : super(list: []);
}

class OrderStockAdjustmentRegisterChangeDirectionkSuccessState
    extends OrderStockAdjustmentRegisterState {
  OrderStockAdjustmentRegisterChangeDirectionkSuccessState() : super(list: []);
}

//======================MASTER - Errors============================

class OrderClosureErrorState extends OrderStockAdjustmentRegisterState {
  OrderClosureErrorState({required super.list});
}

class OrderReopenErrorState extends OrderStockAdjustmentRegisterState {
  OrderReopenErrorState({required super.list});
}
