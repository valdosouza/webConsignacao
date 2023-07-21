abstract class OrderLoadCardRegisterState {}

class OrderLoadCardRegisterLoadingState extends OrderLoadCardRegisterState {}

class OrderLoadCardGetItemsErrorState extends OrderLoadCardRegisterState {
  final String error;

  OrderLoadCardGetItemsErrorState(this.error);
}

class OrderLoadCardGetListErrorState extends OrderLoadCardRegisterState {
  final String error;

  OrderLoadCardGetListErrorState(this.error);
}

class OrderLoadCardGetItemsLoadedState extends OrderLoadCardRegisterState {}

class OrderLoadCardGetListLoadedState extends OrderLoadCardRegisterState {}

class OrderLoadCardPostErrorState extends OrderLoadCardRegisterState {
  final String error;
  OrderLoadCardPostErrorState({
    required this.error,
  });
}

class OrderLoadCardCardPostSucessState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterCalcDoneState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterCleanDoneState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterInfoPageState extends OrderLoadCardRegisterState {}

class OrderClosureSuccessState extends OrderLoadCardRegisterState {
  final String msg;
  OrderClosureSuccessState({
    required this.msg,
  });
}

class OrderClosureErrorState extends OrderLoadCardRegisterState {
  final String error;

  OrderClosureErrorState({required this.error});
}
