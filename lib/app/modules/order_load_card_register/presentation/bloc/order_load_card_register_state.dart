abstract class OrderLoadCardRegisterState {}

class OrderLoadCardRegisterLoadingState extends OrderLoadCardRegisterState {}

class OrderLoadCardGetNewCardListErrorState extends OrderLoadCardRegisterState {
  final String error;

  OrderLoadCardGetNewCardListErrorState(this.error);
}

class OrderLoadCardGetNewCardListLoadedState
    extends OrderLoadCardRegisterState {}

class OrderLoadCardCardPostErrorState extends OrderLoadCardRegisterState {
  final String error;
  OrderLoadCardCardPostErrorState({
    required this.error,
  });
}

class OrderLoadCardCardPostSucessState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterCalcDoneState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterCleanDoneState extends OrderLoadCardRegisterState {}
