import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';

abstract class StockBalanceState {
  List<StockBalanceModel> list;

  StockBalanceState({
    required this.list,
  });
}

class StockBalanceLoadingState extends StockBalanceState {
  StockBalanceLoadingState() : super(list: []);
}

class StockBalanceCustomerLoadingState extends StockBalanceLoadingState {}

class StockBalanceCustomerLoadedState extends StockBalanceState {
  StockBalanceCustomerLoadedState({required List<StockBalanceModel> list})
      : super(list: list);
}

class StockBalanceCustomerErrorState extends StockBalanceState {
  StockBalanceCustomerErrorState({required List<StockBalanceModel> list})
      : super(list: list);
}

class StockBalanceGeneralLoadingState extends StockBalanceLoadingState {}

class StockBalanceGeneralLoadedState extends StockBalanceState {
  StockBalanceGeneralLoadedState({required List<StockBalanceModel> list})
      : super(list: list);
}

class StockBalanceGeneralErrorState extends StockBalanceState {
  StockBalanceGeneralErrorState({required List<StockBalanceModel> list})
      : super(list: list);
}

class StockBalanceSalesmanLoadingState extends StockBalanceLoadingState {}

class StockBalanceSalesmanLoadedState extends StockBalanceState {
  StockBalanceSalesmanLoadedState({required List<StockBalanceModel> list})
      : super(list: list);
}

class StockBalanceSalesmanErrorState extends StockBalanceState {
  StockBalanceSalesmanErrorState({required List<StockBalanceModel> list})
      : super(list: list);
}
