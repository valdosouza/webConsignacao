abstract class StockBalanceEvent {}

class StockBalanceCustomerGetListEvent extends StockBalanceEvent {
  final int tbInstitutionId;
  StockBalanceCustomerGetListEvent({required this.tbInstitutionId});
}

class StockBalanceCustomerSearchEvent extends StockBalanceEvent {
  final String search;
  StockBalanceCustomerSearchEvent({required this.search});
}

class StockBalanceGeneralGetListEvent extends StockBalanceEvent {
  final int tbInstitutionId;
  StockBalanceGeneralGetListEvent({required this.tbInstitutionId});
}

class StockBalanceGeneralSearchEvent extends StockBalanceEvent {
  final String search;
  StockBalanceGeneralSearchEvent({required this.search});
}

class StockBalanceSalesmanGetListEvent extends StockBalanceEvent {
  final int tbInstitutionId;
  StockBalanceSalesmanGetListEvent({required this.tbInstitutionId});
}

class StockBalanceSalesmanSearchEvent extends StockBalanceEvent {
  final String search;
  StockBalanceSalesmanSearchEvent({required this.search});
}
