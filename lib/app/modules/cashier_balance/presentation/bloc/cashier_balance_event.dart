abstract class CashierBalanceEvent {}

class CashierBalanceMobileEvent extends CashierBalanceEvent {
  final int tbInstitutionId;
  final int tbUserId;
  final String date;
  CashierBalanceMobileEvent({
    required this.tbInstitutionId,
    required this.tbUserId,
    required this.date,
  });
}
