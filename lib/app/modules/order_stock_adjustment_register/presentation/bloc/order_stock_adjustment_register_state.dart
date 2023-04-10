abstract class OrderStockAdjustmentRegisterState {}

//======================MASTER============================
class OrderLoadingState extends OrderStockAdjustmentRegisterState {}

class OrderLoadedSucessState extends OrderStockAdjustmentRegisterState {}

class OrderNewLoadedState extends OrderStockAdjustmentRegisterState {}

class OrderGetLoadedState extends OrderStockAdjustmentRegisterState {}

class OrderReturnMasterState extends OrderStockAdjustmentRegisterState {}

class OrderPostSuccessState extends OrderStockAdjustmentRegisterState {}

class OrderPutSuccessState extends OrderStockAdjustmentRegisterState {}

class OrderDeleteSuccessState extends OrderStockAdjustmentRegisterState {}

class OrderClosureSuccessState extends OrderStockAdjustmentRegisterState {}

class OrderReopenSuccessState extends OrderStockAdjustmentRegisterState {}

class EntitiesLoadSuccessState extends OrderStockAdjustmentRegisterState {}

class EntityChosenSuccessState extends OrderStockAdjustmentRegisterState {}

class StocksLoadSuccessState extends OrderStockAdjustmentRegisterState {}

//======================MASTER - Errors============================
class OrderGetErrorState extends OrderStockAdjustmentRegisterState {}

class OrderLoadedErrorState extends OrderStockAdjustmentRegisterState {}

class OrderPostErrorState extends OrderStockAdjustmentRegisterState {}

class OrderPutErrorState extends OrderStockAdjustmentRegisterState {}

class OrderDeleteErrorState extends OrderStockAdjustmentRegisterState {}

class EntityLoadErrorState extends OrderStockAdjustmentRegisterState {}

class StocksLoadErrorState extends OrderStockAdjustmentRegisterState {}

class OrderClosureErrorState extends OrderStockAdjustmentRegisterState {
  OrderClosureErrorState();
}

class OrderReopenErrorState extends OrderStockAdjustmentRegisterState {
  OrderReopenErrorState();
}

//======================Detail============================
class OrderItemUpdateSuccessState extends OrderStockAdjustmentRegisterState {}

class OrderItemPageEditState extends OrderStockAdjustmentRegisterState {}

class ProductGetSucessState extends OrderStockAdjustmentRegisterState {}

class ProductSearchSucessState extends OrderStockAdjustmentRegisterState {}

class ProductChosenSucessState extends OrderStockAdjustmentRegisterState {}

class StockSearchSucessState extends OrderStockAdjustmentRegisterState {}

class EntitySearchSucessState extends OrderStockAdjustmentRegisterState {}

//======================Detail - Errors============================
class OrderItemUpdateErrorState extends OrderStockAdjustmentRegisterState {}

class ProductGetErrorState extends OrderStockAdjustmentRegisterState {}

class ProductSearchErrorState extends OrderStockAdjustmentRegisterState {}

class StockSearchErrorState extends OrderStockAdjustmentRegisterState {}

class EntitySearchErrorState extends OrderStockAdjustmentRegisterState {}
//=================================================================

