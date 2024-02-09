abstract class CashierStatementSummaryState {}

class InitialState extends CashierStatementSummaryState {}

class GetLoadedState extends CashierStatementSummaryState {}

class GetSalesmanLoadedState extends CashierStatementSummaryState {}

class MainFormLoadedState extends CashierStatementSummaryState {}

class LoadingState extends CashierStatementSummaryState {}

class ErrorState extends CashierStatementSummaryState {
  final String msg;

  ErrorState({required this.msg});
}
