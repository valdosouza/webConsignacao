import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';

abstract class StockBalanceGeneralState {
  List<StockBalanceModel> list;

  StockBalanceGeneralState({
    required this.list,
  });
}

class StockBalanceGeneralLoadingState extends StockBalanceGeneralState {
  StockBalanceGeneralLoadingState() : super(list: []);
}

class StockBalanceGeneralLoadedState extends StockBalanceGeneralState {
  StockBalanceGeneralLoadedState(
      {required List<StockBalanceModel> list})
      : super(list: list);
}

class StockBalanceGeneralErrorState extends StockBalanceGeneralState {
  StockBalanceGeneralErrorState(
      {required List<StockBalanceModel> list})
      : super(list: list);
}