abstract class StockBalanceSalesmanEvent {}

class StockBalanceSalesmanGetListEvent
    extends StockBalanceSalesmanEvent {
  final int tbInstitutionId;
  StockBalanceSalesmanGetListEvent({required this.tbInstitutionId});
}

class StockBalanceSalesmanSearchEvent
    extends StockBalanceSalesmanEvent {
  final String search;
  StockBalanceSalesmanSearchEvent({required this.search});
}