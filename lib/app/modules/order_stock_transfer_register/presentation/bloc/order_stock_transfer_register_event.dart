abstract class OrderStockTransferRegisterEvent {}

//======================Master============================
class OrderGetListEvent extends OrderStockTransferRegisterEvent {}

class OrderNewEvent extends OrderStockTransferRegisterEvent {}

class OrderGetEvent extends OrderStockTransferRegisterEvent {}

class OrderPutEvent extends OrderStockTransferRegisterEvent {}

class OrderPostEvent extends OrderStockTransferRegisterEvent {}

class OrderDeleteEvent extends OrderStockTransferRegisterEvent {}

class OrderClosureEvent extends OrderStockTransferRegisterEvent {
  OrderClosureEvent();
}

class OrderReopenEvent extends OrderStockTransferRegisterEvent {
  OrderReopenEvent();
}

class OrderSearchEvent extends OrderStockTransferRegisterEvent {}

class OrderReturnMasterEvent extends OrderStockTransferRegisterEvent {}

//======================Master - Auxiliar============================
class StocksGetEvent extends OrderStockTransferRegisterEvent {
  final String type;
  StocksGetEvent({required this.type});
}

class StockSearchEvent extends OrderStockTransferRegisterEvent {
  final String type;
  StockSearchEvent({required this.type});
}

class StockChosenEvent extends OrderStockTransferRegisterEvent {}

class EntitiesGetEvent extends OrderStockTransferRegisterEvent {}

class EntitySearchEvent extends OrderStockTransferRegisterEvent {}

class EntityChosenEvent extends OrderStockTransferRegisterEvent {}

//======================Detail============================
class OrderItemFilterActiveEvent extends OrderStockTransferRegisterEvent {}

class OrderItemNewEvent extends OrderStockTransferRegisterEvent {}

class OrderItemEditEvent extends OrderStockTransferRegisterEvent {}

class OrderItemUpdateEvent extends OrderStockTransferRegisterEvent {}

class OrderItemDeleteEvent extends OrderStockTransferRegisterEvent {}

//======================Detail - Auxiliar=========================
class ProductsGetEvent extends OrderStockTransferRegisterEvent {}

class ProductsSearchEvent extends OrderStockTransferRegisterEvent {}

class ProductChosenEvent extends OrderStockTransferRegisterEvent {}
//=========================================================
