import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';

abstract class OrderStockAdjustmentRegisterEvent {}

class OrderStockAdjustmentRegisterGetListEvent
    extends OrderStockAdjustmentRegisterEvent {}

class OrderStockAdjustmentRegisterGetStocksEvent
    extends OrderStockAdjustmentRegisterEvent {
  final int tbInstitutionId;
  OrderStockAdjustmentRegisterGetStocksEvent({required this.tbInstitutionId});
}

class OrderStockAdjustmentRegisterGetProductsEvent
    extends OrderStockAdjustmentRegisterEvent {
  final int tbInstitutionId;
  OrderStockAdjustmentRegisterGetProductsEvent({required this.tbInstitutionId});
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
  OrderStockAdjustmentRegisterReturnEvent();
}
