abstract class CashierBalanceEvent {}

class CashierBalanceMobileEvent extends CashierBalanceEvent {
  final String date;
  CashierBalanceMobileEvent({
    required this.date,
  });
}

class CashierBalanceGetDateEvent extends CashierBalanceEvent {}
