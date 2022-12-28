abstract class StockBalanceGeneralEvent {}

class StockBalanceGeneralGetListEvent
    extends StockBalanceGeneralEvent {
  final int tbInstitutionId;
  StockBalanceGeneralGetListEvent({required this.tbInstitutionId});
}