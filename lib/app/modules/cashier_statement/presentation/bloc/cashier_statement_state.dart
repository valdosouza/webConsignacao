abstract class CashierStatementState {}

class CashierStatementLoadedState extends CashierStatementState {
  CashierStatementLoadedState();
}

class CashierStatementLoadingState extends CashierStatementState {
  CashierStatementLoadingState();
}

class CashierStatementMobileSuccessState extends CashierStatementState {
  CashierStatementMobileSuccessState();
}

class CashierStatementMobileErrorState extends CashierStatementState {
  CashierStatementMobileErrorState();
}

class CashierStatementCustomerMobileSuccessState extends CashierStatementState {
  CashierStatementCustomerMobileSuccessState();
}

class CashierStatementCustomerMobileErrorState extends CashierStatementState {
  CashierStatementCustomerMobileErrorState();
}
