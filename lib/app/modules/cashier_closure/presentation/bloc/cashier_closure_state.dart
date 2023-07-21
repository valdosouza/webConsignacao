abstract class CashierClosureState {
  const CashierClosureState();
}

class CashierClosureLoadingState extends CashierClosureState {}

class CashierClosureGetClosureErrorState extends CashierClosureState {}

class CashierClosureGetClosureLoadedState extends CashierClosureState {}

class CashierClosureSeachedState extends CashierClosureState {}

class CashierClosureGetClosurePreviouslyLoadedState
    extends CashierClosureState {}

class GetCurrentDateSucessState extends CashierClosureState {}

class PostSucessState extends CashierClosureState {
  final String message;
  PostSucessState({required this.message});
}

class MobileSuccessState extends CashierClosureState {}

class MobileErrorState extends CashierClosureState {}
