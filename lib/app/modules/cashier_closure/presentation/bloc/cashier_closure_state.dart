part of 'cashier_closure_bloc.dart';

abstract class CashierClosureState extends Equatable {
  const CashierClosureState();

  @override
  List<Object> get props => [];
}

class CashierClosureLoadingState extends CashierClosureState {}

class CashierClosureGetClosureErrorState extends CashierClosureState {}

class CashierClosureGetClosureLoadedState extends CashierClosureState {
  const CashierClosureGetClosureLoadedState({required this.closure});
  final ClosureModel closure;
}

class CashierClosureGetClosurePreviouslyLoadedState
    extends CashierClosureState {
  const CashierClosureGetClosurePreviouslyLoadedState({
    required this.closures,
  });
  final List<CashierClosurePreviouslyModel> closures;
}
