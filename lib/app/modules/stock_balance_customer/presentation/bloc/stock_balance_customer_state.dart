import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';

abstract class StockBalanceCustomerState {
  List<StockBalanceModel> list;

  StockBalanceCustomerState({
    required this.list,
  });
}

class StockBalanceCustomerLoadingState extends StockBalanceCustomerState {
  StockBalanceCustomerLoadingState() : super(list: []);
}

class StockBalanceCustomerLoadedState extends StockBalanceCustomerState {
  StockBalanceCustomerLoadedState(
      {required List<StockBalanceModel> list})
      : super(list: list);
}

class StockBalanceCustomerErrorState extends StockBalanceCustomerState {
  StockBalanceCustomerErrorState(
      {required List<StockBalanceModel> list})
      : super(list: list);
}