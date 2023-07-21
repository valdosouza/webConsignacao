import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/entity/order_stock_adjustment_register_items_entity.dart';

abstract class OrderStockAdjustmentRegisterEvent {}

class OrderStockAdjustmentRegisterGetListEvent
    extends OrderStockAdjustmentRegisterEvent {}

class OrderStockAdjustmentRegisterGetStocksEvent
    extends OrderStockAdjustmentRegisterEvent {
  OrderStockAdjustmentRegisterGetStocksEvent();
}

class OrderStockAdjustmentRegisterGetProductsEvent
    extends OrderStockAdjustmentRegisterEvent {
  OrderStockAdjustmentRegisterGetProductsEvent();
}

class OrderStockAdjustmentRegisterSearchProductsEvent
    extends OrderStockAdjustmentRegisterEvent {
  final String search;
  OrderStockAdjustmentRegisterSearchProductsEvent({required this.search});
}

class OrderStockAdjustmentRegisterGetEntityEvent
    extends OrderStockAdjustmentRegisterEvent {
  OrderStockAdjustmentRegisterGetEntityEvent();
}

class OrderStockAdjustmentRegisterSearchEntityEvent
    extends OrderStockAdjustmentRegisterEvent {
  final String search;
  OrderStockAdjustmentRegisterSearchEntityEvent({required this.search});
}

class OrderStockAdjustmentRegisterSearchStocksEvent
    extends OrderStockAdjustmentRegisterEvent {
  final String search;
  OrderStockAdjustmentRegisterSearchStocksEvent({required this.search});
}

class OrderStockAdjustmentRegisterSearchEvent
    extends OrderStockAdjustmentRegisterEvent {
  String search;
  OrderStockAdjustmentRegisterSearchEvent({
    required this.search,
  });
}

class OrderStockAdjustmentRegisterItemEvent
    extends OrderStockAdjustmentRegisterEvent {
  OrderStockAdjustmentRegisterItemsEntity? item;
  OrderStockAdjustmentRegisterItemEvent({this.item});
}

class OrderStockAdjustmentRegisterPutEvent
    extends OrderStockAdjustmentRegisterEvent {
  final OrderStockAdjustmentRegisterModel model;

  OrderStockAdjustmentRegisterPutEvent({required this.model});
}

class OrderStockAdjustmentRegisterPostEvent
    extends OrderStockAdjustmentRegisterEvent {
  final OrderStockAdjustmentRegisterModel model;

  OrderStockAdjustmentRegisterPostEvent({required this.model});
}

class OrderStockAdjustmentRegisterDeleteEvent
    extends OrderStockAdjustmentRegisterEvent {
  final OrderStockAdjustmentRegisterModel model;

  OrderStockAdjustmentRegisterDeleteEvent({required this.model});
}

class OrderClosureEvent extends OrderStockAdjustmentRegisterEvent {
  OrderClosureEvent();
}

class OrderReopenEvent extends OrderStockAdjustmentRegisterEvent {
  OrderReopenEvent();
}

class OrderStockAdjustmentRegisterDesktopEvent
    extends OrderStockAdjustmentRegisterEvent {
  final OrderStockAdjustmentRegisterModel? model;
  OrderStockAdjustmentRegisterDesktopEvent({this.model});
}

class OrderStockAdjustmentRegisterMobileEvent
    extends OrderStockAdjustmentRegisterEvent {
  final OrderStockAdjustmentRegisterModel? model;
  OrderStockAdjustmentRegisterMobileEvent({this.model});
}

class OrderStockAdjustmentRegisterReturnEvent
    extends OrderStockAdjustmentRegisterEvent {
  final int tabIndex;
  final OrderStockAdjustmentRegisterItemsModel? item;
  OrderStockAdjustmentRegisterReturnEvent({this.tabIndex = 0, this.item});
}

class OrderStockAdjustmentRegisterChangeDirectionEvent
    extends OrderStockAdjustmentRegisterEvent {
  OrderStockAdjustmentRegisterChangeDirectionEvent();
}
