abstract class OrderProductionRegisterState {}

//======================MASTER====================================
class OrderLoadingState extends OrderProductionRegisterState {}

class OrderLoadedSucessState extends OrderProductionRegisterState {}

class OrderSearchSucessState extends OrderProductionRegisterState {}

class OrderGetLoadedState extends OrderProductionRegisterState {}

class OrderInfoPageState extends OrderProductionRegisterState {}

class OrderReturnState extends OrderProductionRegisterState {}

class OrderPostSuccessState extends OrderProductionRegisterState {}

class OrderPutSuccessState extends OrderProductionRegisterState {}

class OrderDeleteSuccessState extends OrderProductionRegisterState {}

class OrderClosureSuccessState extends OrderProductionRegisterState {
  final String result;
  OrderClosureSuccessState({
    required this.result,
  });
}

class OrderReopenSuccessState extends OrderProductionRegisterState {
  final String result;
  OrderReopenSuccessState({
    required this.result,
  });
}

class StocksLoadSuccessState extends OrderProductionRegisterState {
  final String type;

  StocksLoadSuccessState({required this.type});
}

//======================AUXIXLIARES===================================

class OrderGetStockSucessState extends OrderProductionRegisterState {}

class OrderSearchStockSucessState extends OrderProductionRegisterState {}

class OrderGetProductSucessState extends OrderProductionRegisterState {}

class OrderSearchProductSucessState extends OrderProductionRegisterState {}

//======================MASTER - Errors============================
class OrderGetErrorState extends OrderProductionRegisterState {}

class OrderLoadedErrorState extends OrderProductionRegisterState {}

class OrderPostErrorState extends OrderProductionRegisterState {}

class OrderPutErrorState extends OrderProductionRegisterState {}

class OrderDeleteErrorState extends OrderProductionRegisterState {}

class OrderClosureErrorState extends OrderProductionRegisterState {}

class OrderReopenErrorState extends OrderProductionRegisterState {}

class StocksLoadErrorState extends OrderProductionRegisterState {}

//======================AUXILIARES - Errors============================

class OrderGetStockErrorState extends OrderProductionRegisterState {}

class OrderGetProductErrorState extends OrderProductionRegisterState {}
