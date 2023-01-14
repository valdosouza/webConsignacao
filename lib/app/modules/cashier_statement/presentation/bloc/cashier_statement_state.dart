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

class CashierStatementByCustomerState extends CashierStatementState {
  CashierStatementByCustomerState();
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
