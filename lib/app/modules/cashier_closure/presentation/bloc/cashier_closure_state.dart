part of 'cashier_closure_bloc.dart';

abstract class CashierClosureState {
  const CashierClosureState();
}

class CashierClosureLoadingState extends CashierClosureState {}

class CashierClosureGetClosureErrorState extends CashierClosureState {}

class CashierClosureGetClosureLoadedState extends CashierClosureState {
  const CashierClosureGetClosureLoadedState();
}

class CashierClosureGetClosurePreviouslyLoadedState
    extends CashierClosureState {
  const CashierClosureGetClosurePreviouslyLoadedState({
    required this.closures,
  });
  final List<CashierClosurePreviouslyModel> closures;
}
