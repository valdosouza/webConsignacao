abstract class OrderLoadCardRegisterState {}

class OrderLoadCardRegisterLoadingState extends OrderLoadCardRegisterState {}

class OrderLoadCardGetItemsErrorState extends OrderLoadCardRegisterState {
  final String error;

  OrderLoadCardGetItemsErrorState(this.error);
}

class OrderLoadCardGetItemsLoadedState extends OrderLoadCardRegisterState {}

class OrderLoadCardPostErrorState extends OrderLoadCardRegisterState {
  final String error;
  OrderLoadCardPostErrorState({
    required this.error,
  });
}

class OrderLoadCardCardPostSucessState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterCalcDoneState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterCleanDoneState extends OrderLoadCardRegisterState {}
