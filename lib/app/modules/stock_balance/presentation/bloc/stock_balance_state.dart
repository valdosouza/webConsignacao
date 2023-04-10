abstract class StockBalanceState {}

class StockBalanceLoadingState extends StockBalanceState {}

class StockBalanceErrorState extends StockBalanceState {}

//====================Customer================================
class GetListByCustomerLoadedState extends StockBalanceState {}

//============================Salesman Liability=========================

class GetListBySalesmanLiabilityLoadedState extends StockBalanceState {}

//============================Salesman==================================

class GetListBySalesmanLoadedState extends StockBalanceState {}

//==========================StockList==================================
class GetStockListLoadedState extends StockBalanceState {}

class GetListByStockListLoadedState extends StockBalanceState {}

class StockBalanceGetStockListErrorState extends StockBalanceState {}

class StockBalanceSearchSucessState extends StockBalanceState {}
