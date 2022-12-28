abstract class StockBalanceCustomerEvent {}

class StockBalanceCustomerGetListEvent
    extends StockBalanceCustomerEvent {
  final int tbInstitutionId;
  StockBalanceCustomerGetListEvent({required this.tbInstitutionId});
}

class StockBalanceCustomerSearchEvent
    extends StockBalanceCustomerEvent {
  final String search;
  StockBalanceCustomerSearchEvent({required this.search});
}