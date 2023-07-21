abstract class CashierStatementState {}

class LoadedState extends CashierStatementState {}

class LoadingState extends CashierStatementState {}

class MobileSuccessState extends CashierStatementState {}

class ByCustomerState extends CashierStatementState {}

class MobileErrorState extends CashierStatementState {}

class CustomerMobileSuccessState extends CashierStatementState {}

class CustomerMobileErrorState extends CashierStatementState {}

class GetCurrentDateSucessState extends CashierStatementState {}

//---------------------------DEsktop---------------------------------------
class DesktopErrorState extends CashierStatementState {}

class GoToSalesmanListDesktopSucessState extends CashierStatementState {}

class ReturnSalesmanListDesktopSucessState extends CashierStatementState {}

class GoToCustomerListDesktopSucessState extends CashierStatementState {}

class ReturnCustomerListDesktopSucessState extends CashierStatementState {}

class GoToOrderDetailDesktopSucessState extends CashierStatementState {}
