abstract class StockBalanceCustomerEvent {}

class StockBalanceCustomerGetListEvent
    extends StockBalanceCustomerEvent {
  final int tbInstitutionId;
  StockBalanceCustomerGetListEvent({required this.tbInstitutionId});
}