import '../../domain/entity/cashier_balance_entity.dart';

abstract class CashierBalanceState {
  CashierBalanceEntity? model;

  CashierBalanceState({
    required this.model,
  });
}

class CashierBalanceLoadingState extends CashierBalanceState {
  CashierBalanceLoadingState()
      : super(model: null);
}

class CashierBalanceMobileSuccessState extends CashierBalanceState {
  CashierBalanceMobileSuccessState(
      {required CashierBalanceEntity model})
      : super(model: model);
}

class CashierBalanceMobileErrorState extends CashierBalanceState {
  CashierBalanceMobileErrorState(
      {required CashierBalanceEntity? model})
      : super(model: model);
}
