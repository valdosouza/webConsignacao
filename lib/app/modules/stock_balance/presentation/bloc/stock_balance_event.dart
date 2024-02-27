import 'package:appweb/app/modules/stock_balance/domain/usecase/customer_all_by_products.dart';

abstract class StockBalanceEvent {}

class StockBalanceGetListEvent extends StockBalanceEvent {
  final int tbStockListId;
  StockBalanceGetListEvent({required this.tbStockListId});
}

class StockBalanceSearchEvent extends StockBalanceEvent {
  final String search;
  StockBalanceSearchEvent({required this.search});
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
  StockBalanceSalesmanGetListEvent();
}

class StockBalanceSalesmanSearchEvent extends StockBalanceEvent {
  final String search;
  StockBalanceSalesmanSearchEvent({required this.search});
}

//==========================Get StockList===========================
class StockBalanceReturnStockListPagEvent extends StockBalanceEvent {}

class StockBalanceGetStockListEvent extends StockBalanceEvent {}

class StockBalanceSearcheStocksListEvent extends StockBalanceEvent {
  final String search;
  StockBalanceSearcheStocksListEvent({
    required this.search,
  });
}

//=================Get StockList All Customer By Product=======================
class GetStockBalanceAllCutomerByProductEvent extends StockBalanceEvent {
  final ParamsGetCustomerAllByProducts params;
  GetStockBalanceAllCutomerByProductEvent({
    required this.params,
  });
}

class GotoStockBalanceCustomerEvent extends StockBalanceEvent {}

class FilterCustomerEvent extends StockBalanceEvent {}

class FilterBalanceDivergentEvent extends StockBalanceEvent {}
