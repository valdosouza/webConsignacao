abstract class StockBalanceSalesmanEvent {}

class StockBalanceSalesmanGetListEvent
    extends StockBalanceSalesmanEvent {
  final int tbInstitutionId;
  StockBalanceSalesmanGetListEvent({required this.tbInstitutionId});
}