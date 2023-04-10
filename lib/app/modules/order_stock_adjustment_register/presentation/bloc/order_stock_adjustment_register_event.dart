abstract class OrderStockAdjustmentRegisterEvent {}

//======================Master============================
class OrderGetListEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderNewEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderGetEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderPutEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderPostEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderDeleteEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderClosureEvent extends OrderStockAdjustmentRegisterEvent {
  OrderClosureEvent();
}

class OrderReopenEvent extends OrderStockAdjustmentRegisterEvent {
  OrderReopenEvent();
}

class OrderSearchEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderReturnMasterEvent extends OrderStockAdjustmentRegisterEvent {}

//======================Master - Auxiliar============================
class StocksGetEvent extends OrderStockAdjustmentRegisterEvent {}

class StockSearchEvent extends OrderStockAdjustmentRegisterEvent {}

class StockChosenEvent extends OrderStockAdjustmentRegisterEvent {}

class EntitiesGetEvent extends OrderStockAdjustmentRegisterEvent {}

class EntitySearchEvent extends OrderStockAdjustmentRegisterEvent {}

class EntityChosenEvent extends OrderStockAdjustmentRegisterEvent {}

//======================Detail============================
class OrderItemFilterActiveEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderItemNewEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderItemEditEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderItemUpdateEvent extends OrderStockAdjustmentRegisterEvent {}

class OrderItemDeleteEvent extends OrderStockAdjustmentRegisterEvent {}

//======================Detail - Auxiliar=========================
class ProductsGetEvent extends OrderStockAdjustmentRegisterEvent {}

class ProductsSearchEvent extends OrderStockAdjustmentRegisterEvent {}

class ProductChosenEvent extends OrderStockAdjustmentRegisterEvent {}
//=========================================================
