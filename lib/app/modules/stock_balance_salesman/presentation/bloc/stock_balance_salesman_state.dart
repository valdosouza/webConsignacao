import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';

abstract class StockBalanceSalesmanState {
  List<StockBalanceModel> list;

  StockBalanceSalesmanState({
    required this.list,
  });
}

class StockBalanceSalesmanLoadingState extends StockBalanceSalesmanState {
  StockBalanceSalesmanLoadingState() : super(list: []);
}

class StockBalanceSalesmanLoadedState extends StockBalanceSalesmanState {
  StockBalanceSalesmanLoadedState(
      {required List<StockBalanceModel> list})
      : super(list: list);
}

class StockBalanceSalesmanErrorState extends StockBalanceSalesmanState {
  StockBalanceSalesmanErrorState(
      {required List<StockBalanceModel> list})
      : super(list: list);
}