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
class SalesmanDesktopErrorState extends CashierStatementState {}

class SalesmanDesktopGetListSucessState extends CashierStatementState {}

class ByCustomerDesktopSucessState extends CashierStatementState {}

class ReturnSalesmanListSucessState extends CashierStatementState {}
