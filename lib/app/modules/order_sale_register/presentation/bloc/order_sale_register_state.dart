abstract class OrderSaleRegisterState {}

//======================MASTER============================
class OrderLoadingState extends OrderSaleRegisterState {}

class OrderLoadedSucessState extends OrderSaleRegisterState {}

class OrderNewLoadedState extends OrderSaleRegisterState {}

class OrderGetLoadedState extends OrderSaleRegisterState {}

class OrderReturnMasterState extends OrderSaleRegisterState {}

class OrderPostSuccessState extends OrderSaleRegisterState {}

class OrderPutSuccessState extends OrderSaleRegisterState {}

class OrderDeleteSuccessState extends OrderSaleRegisterState {}

class OrderClosureSuccessState extends OrderSaleRegisterState {}

class OrderReopenSuccessState extends OrderSaleRegisterState {}

class EntitiesLoadSuccessState extends OrderSaleRegisterState {}

class EntityChosenSuccessState extends OrderSaleRegisterState {}

class StocksLoadSuccessState extends OrderSaleRegisterState {}

//======================MASTER - Errors============================
class OrderGetErrorState extends OrderSaleRegisterState {}

class OrderLoadedErrorState extends OrderSaleRegisterState {}

class OrderPostErrorState extends OrderSaleRegisterState {}

class OrderPutErrorState extends OrderSaleRegisterState {}

class OrderDeleteErrorState extends OrderSaleRegisterState {}

class EntityLoadErrorState extends OrderSaleRegisterState {}

class StocksLoadErrorState extends OrderSaleRegisterState {}

class OrderClosureErrorState extends OrderSaleRegisterState {
  OrderClosureErrorState();
}

class OrderReopenErrorState extends OrderSaleRegisterState {
  OrderReopenErrorState();
}

//======================Detail============================
class OrderItemUpdateSuccessState extends OrderSaleRegisterState {}

class OrderItemPageEditState extends OrderSaleRegisterState {}

class ProductGetSucessState extends OrderSaleRegisterState {}

class ProductSearchSucessState extends OrderSaleRegisterState {}

class ProductChosenSucessState extends OrderSaleRegisterState {}

class StockSearchSucessState extends OrderSaleRegisterState {}

class EntitySearchSucessState extends OrderSaleRegisterState {}

//======================Detail - Errors============================
class OrderItemUpdateErrorState extends OrderSaleRegisterState {}

class ProductGetErrorState extends OrderSaleRegisterState {}

class ProductSearchErrorState extends OrderSaleRegisterState {}

class StockSearchErrorState extends OrderSaleRegisterState {}

class EntitySearchErrorState extends OrderSaleRegisterState {}
//=================================================================

