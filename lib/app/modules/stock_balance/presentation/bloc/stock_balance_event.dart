abstract class StockBalanceEvent {}

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
