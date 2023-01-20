abstract class PaymentTypeRegisterEvent {}

class PaymentTypeRegisterGetListEvent extends PaymentTypeRegisterEvent {}

class PaymentTypeRegisterSearchEvent extends PaymentTypeRegisterEvent {
  String search;

  PaymentTypeRegisterSearchEvent({
    required this.search,
  });
}

class PaymentTypeRegisterPutEvent extends PaymentTypeRegisterEvent {
  PaymentTypeRegisterPutEvent();
}

class PaymentTypeRegisterPostEvent extends PaymentTypeRegisterEvent {
  PaymentTypeRegisterPostEvent();
}

class PaymentTypeRegisterAddEvent extends PaymentTypeRegisterEvent {
  PaymentTypeRegisterAddEvent();
}

class PaymentTypeRegisterEditEvent extends PaymentTypeRegisterEvent {
  PaymentTypeRegisterEditEvent();
}
