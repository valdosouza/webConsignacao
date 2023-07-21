import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';

abstract class CashierBalanceState {}

class CashierBalanceLoadingState extends CashierBalanceState {
  CashierBalanceLoadingState();
}

class CashierBalanceMobileSuccessState extends CashierBalanceState {
  final CashierBalanceModel model;
  CashierBalanceMobileSuccessState({
    required this.model,
  });
}

class CashierBalanceMobileErrorState extends CashierBalanceState {
  CashierBalanceMobileErrorState();
}

class CashierBalanceGetCurrentDateSucessState extends CashierBalanceState {
  CashierBalanceGetCurrentDateSucessState();
}
