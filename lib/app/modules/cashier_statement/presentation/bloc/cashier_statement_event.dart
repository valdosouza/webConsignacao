import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';

abstract class CashierStatementEvent {}

class CashierStatementGetByDayMobileEvent extends CashierStatementEvent {
  CashierStatementParams params;
  CashierStatementGetByDayMobileEvent({
    required this.params,
  });
}

class CashierStatementGetByMonthMobileEvent extends CashierStatementEvent {
  CashierStatementParams params;
  CashierStatementGetByMonthMobileEvent({
    required this.params,
  });
}

class CashierStatementGetByCustomerMobileEvent extends CashierStatementEvent {
  CashierStatementParams params;
  CashierStatementGetByCustomerMobileEvent({
    required this.params,
  });
}

class CashierStatementGetByOrderMobileEvent extends CashierStatementEvent {
  CashierStatementParams params;
  CashierStatementGetByOrderMobileEvent({
    required this.params,
  });
}

class CashierStatementGetCustomersMobileEvent extends CashierStatementEvent {
  CashierStatementParams params;
  CashierStatementGetCustomersMobileEvent({
    required this.params,
  });
}

class GetCurrentDateEvent extends CashierStatementEvent {}

//---------------------------DEsktop---------------------------------------
class GetSalesmanDesktopEvent extends CashierStatementEvent {
  CashierStatementParams params;
  GetSalesmanDesktopEvent({
    required this.params,
  });
}

class CashierStatementGetByCustomerDesktopEvent extends CashierStatementEvent {
  CashierStatementParams params;
  CashierStatementGetByCustomerDesktopEvent({
    required this.params,
  });
}

class CashierStatementReturnListSalesmanEvent extends CashierStatementEvent {}
