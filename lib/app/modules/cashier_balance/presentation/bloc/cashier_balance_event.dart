// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CashierBalanceEvent {}

class CashierBalanceMobileEvent extends CashierBalanceEvent {
  final int id;
  final int userId;
  final String date;
  CashierBalanceMobileEvent({
    required this.id,
    required this.userId,
    required this.date,
  });
}
