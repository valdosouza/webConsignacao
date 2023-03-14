import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';

abstract class StockBalanceState {}

class StockBalanceLoadingState extends StockBalanceState {}

class StockBalanceErrorState extends StockBalanceState {}

//====================Customer================================
class StockBalanceCustomerLoadedState extends StockBalanceState {
  final StockBalanceModel item;
  StockBalanceCustomerLoadedState({
    required this.item,
  });
}

//============================General==================================

class StockBalanceGeneralLoadedState extends StockBalanceState {
  final StockBalanceModel item;
  StockBalanceGeneralLoadedState({
    required this.item,
  });
}

//============================Salesman==================================

class StockBalanceSalesmanLoadedState extends StockBalanceState {
  final StockBalanceModel item;
  StockBalanceSalesmanLoadedState({
    required this.item,
  });
}

//============================Salesman==================================

class StockBalanceLoadedState extends StockBalanceState {
  final StockBalanceModel item;
  StockBalanceLoadedState({
    required this.item,
  });
}

//==========================StockList==================================
class StockBalanceGetStockListSucessState extends StockBalanceState {
  final List<StockListModel> item;
  StockBalanceGetStockListSucessState({
    required this.item,
  });
}

class StockBalanceGetStockListErrorState extends StockBalanceState {}
