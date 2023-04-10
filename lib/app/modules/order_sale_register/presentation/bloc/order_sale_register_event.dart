abstract class OrderSaleRegisterEvent {}

//======================Master============================
class OrderGetListEvent extends OrderSaleRegisterEvent {}

class OrderNewEvent extends OrderSaleRegisterEvent {}

class OrderGetEvent extends OrderSaleRegisterEvent {}

class OrderPutEvent extends OrderSaleRegisterEvent {}

class OrderPostEvent extends OrderSaleRegisterEvent {}

class OrderDeleteEvent extends OrderSaleRegisterEvent {}

class OrderClosureEvent extends OrderSaleRegisterEvent {
  OrderClosureEvent();
}

class OrderReopenEvent extends OrderSaleRegisterEvent {
  OrderReopenEvent();
}

class OrderSearchEvent extends OrderSaleRegisterEvent {}

class OrderReturnMasterEvent extends OrderSaleRegisterEvent {}

//======================Master - Auxiliar============================
class StocksGetEvent extends OrderSaleRegisterEvent {}

class StockSearchEvent extends OrderSaleRegisterEvent {
  final String type;
  StockSearchEvent({required this.type});
}

class StockChosenEvent extends OrderSaleRegisterEvent {}

class EntitiesGetEvent extends OrderSaleRegisterEvent {}

class EntitySearchEvent extends OrderSaleRegisterEvent {}

class EntityChosenEvent extends OrderSaleRegisterEvent {}

//======================Detail============================
class OrderItemFilterActiveEvent extends OrderSaleRegisterEvent {}

class OrderItemNewEvent extends OrderSaleRegisterEvent {}

class OrderItemEditEvent extends OrderSaleRegisterEvent {}

class OrderItemUpdateEvent extends OrderSaleRegisterEvent {}

class OrderItemDeleteEvent extends OrderSaleRegisterEvent {}

//======================Detail - Auxiliar=========================
class ProductsGetEvent extends OrderSaleRegisterEvent {}

class ProductsSearchEvent extends OrderSaleRegisterEvent {}

class ProductChosenEvent extends OrderSaleRegisterEvent {}
//=========================================================
