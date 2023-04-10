import 'package:appweb/app/modules/stock_balance/data/model/params_get_list_stock_balance_model.dart';

abstract class StockBalanceEvent {}

class StockBalanceGetListEvent extends StockBalanceEvent {
  ParamsGetlistStockBalanceModel params;
  StockBalanceGetListEvent(this.params);
}

class StockBalanceSearchEvent extends StockBalanceEvent {
  StockBalanceSearchEvent();
}

class StockBalanceCustomerGetListEvent extends StockBalanceEvent {
  StockBalanceCustomerGetListEvent();
}

class StockBalanceCustomerSearchEvent extends StockBalanceEvent {
  final String search;
  StockBalanceCustomerSearchEvent({required this.search});
}

class StockBalanceGeneralGetListEvent extends StockBalanceEvent {
  StockBalanceGeneralGetListEvent();
}

class StockBalanceGeneralSearchEvent extends StockBalanceEvent {
  final String search;
  StockBalanceGeneralSearchEvent({required this.search});
}

class StockBalanceSalesmanGetListEvent extends StockBalanceEvent {
  ParamsGetlistStockBalanceModel params;
  StockBalanceSalesmanGetListEvent(
    this.params,
  );
}

class StockBalanceSalesmanSearchEvent extends StockBalanceEvent {
  final String search;
  StockBalanceSalesmanSearchEvent({required this.search});
}

//==========================Get StockList===========================
class StockBalanceReturnStockListPagEvent extends StockBalanceEvent {}

class GetStockListEvent extends StockBalanceEvent {}

class StockBalanceSearcheStocksListEvent extends StockBalanceEvent {
  final String search;
  StockBalanceSearcheStocksListEvent({
    required this.search,
  });
}
