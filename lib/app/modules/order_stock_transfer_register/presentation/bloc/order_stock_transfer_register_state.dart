abstract class OrderStockTransferRegisterState {}

//======================MASTER============================
class OrderLoadingState extends OrderStockTransferRegisterState {}

class OrderLoadedSucessState extends OrderStockTransferRegisterState {}

class OrderNewLoadedState extends OrderStockTransferRegisterState {}

class OrderGetLoadedState extends OrderStockTransferRegisterState {}

class OrderPostSuccessState extends OrderStockTransferRegisterState {}

class OrderPutSuccessState extends OrderStockTransferRegisterState {}

class OrderDeleteSuccessState extends OrderStockTransferRegisterState {}

class EntitiesLoadSuccessState extends OrderStockTransferRegisterState {}

class EntityChosenSuccessState extends OrderStockTransferRegisterState {}

class StocksLoadSuccessState extends OrderStockTransferRegisterState {
  final String type;

  StocksLoadSuccessState({required this.type});
}

//======================MASTER - Errors============================
class OrderGetErrorState extends OrderStockTransferRegisterState {}

class OrderLoadedErrorState extends OrderStockTransferRegisterState {}

class OrderPostErrorState extends OrderStockTransferRegisterState {}

class OrderPutErrorState extends OrderStockTransferRegisterState {}

class OrderDeleteErrorState extends OrderStockTransferRegisterState {}

class EntityLoadErrorState extends OrderStockTransferRegisterState {}

class StocksLoadErrorState extends OrderStockTransferRegisterState {}

//======================Detail============================
class OrderItemUpdateSuccessState extends OrderStockTransferRegisterState {}

class OrderItemPageEditState extends OrderStockTransferRegisterState {}

class ProductGetSucessState extends OrderStockTransferRegisterState {}

class ProductSearchSucessState extends OrderStockTransferRegisterState {}

class ProductChosenSucessState extends OrderStockTransferRegisterState {}

class StockSearchSucessState extends OrderStockTransferRegisterState {}

class EntitySearchSucessState extends OrderStockTransferRegisterState {}

//======================Detail - Errors============================
class OrderItemUpdateErrorState extends OrderStockTransferRegisterState {}

class ProductGetErrorState extends OrderStockTransferRegisterState {}

class ProductSearchErrorState extends OrderStockTransferRegisterState {}

class StockSearchErrorState extends OrderStockTransferRegisterState {}

class EntitySearchErrorState extends OrderStockTransferRegisterState {}
//=================================================================

