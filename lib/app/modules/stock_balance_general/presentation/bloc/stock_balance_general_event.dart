abstract class StockBalanceGeneralEvent {}

class StockBalanceGeneralGetListEvent
    extends StockBalanceGeneralEvent {
  final int tbInstitutionId;
  StockBalanceGeneralGetListEvent({required this.tbInstitutionId});
}

class StockBalanceGeneralSearchEvent
    extends StockBalanceGeneralEvent {
  final String search;
  StockBalanceGeneralSearchEvent({required this.search});
}