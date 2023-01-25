import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';

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

class GetCurrentDateSucessState extends CashierClosureState {}

class PostSucessState extends CashierClosureState {
  final String message;
  PostSucessState({required this.message});
}

class MobileSuccessState extends CashierClosureState {}

class MobileErrorState extends CashierClosureState {}
