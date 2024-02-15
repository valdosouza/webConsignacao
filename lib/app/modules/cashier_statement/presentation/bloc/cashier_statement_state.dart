import 'package:appweb/app/modules/cashier_statement/data/model/customers_old_debit_model.dart';

abstract class CashierStatementState {}

class LoadedState extends CashierStatementState {}

class LoadingState extends CashierStatementState {}

class MobileSuccessState extends CashierStatementState {}

class ByCustomerState extends CashierStatementState {}

class CustomerMobileSuccessState extends CashierStatementState {}

class GetCurrentDateSucessState extends CashierStatementState {}

class GetCustomerOldDebitSucessState extends CashierStatementState {
  final List<CustomersOldDebitModel> list;

  GetCustomerOldDebitSucessState({required this.list});
}

//---------------------------DEsktop---------------------------------------

class GoToSalesmanListDesktopSucessState extends CashierStatementState {}

class ReturnSalesmanListDesktopSucessState extends CashierStatementState {}

class GoToCustomerListDesktopSucessState extends CashierStatementState {}

class ReturnCustomerListDesktopSucessState extends CashierStatementState {}

class GoToOrderDetailDesktopSucessState extends CashierStatementState {}

//-----------------------------------------------------------
class ErrorState extends CashierStatementState {
  final String msg;

  ErrorState({required this.msg});
}

class GetSalesmanLoadedState extends CashierStatementState {}

class MainFormLoadedState extends CashierStatementState {}
