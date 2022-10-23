import 'package:appweb/app/modules/payment/data/model/payment_model.dart';

abstract class PaymentState {
  List<PaymentModel> payment;

  PaymentState({
    required this.payment,
  });
}

class PaymentInitialState extends PaymentState {
  PaymentInitialState() : super(payment: []);
}

class PaymentSuccessState extends PaymentState {
  PaymentSuccessState({
    required List<PaymentModel> payment,
  }) : super(payment: payment);
}

class PaymentEditSuccessState extends PaymentState {
  PaymentEditSuccessState({required List<PaymentModel> payment})
      : super(payment: payment);
}

class PaymentAddSuccessState extends PaymentState {
  PaymentAddSuccessState()
      : super(payment: []);
}

class PaymentPutErrorState extends PaymentState {
  PaymentPutErrorState({required List<PaymentModel> payment})
      : super(payment: payment);
}
class PaymentPutSuccessState extends PaymentState {
  PaymentPutSuccessState()
      : super(payment: []);
}

class PaymentAddErrorState extends PaymentState {
  PaymentAddErrorState({required List<PaymentModel> payment})
      : super(payment: payment);
}
class PaymentGetlistErrorState extends PaymentState {
  PaymentGetlistErrorState() : super(payment: []);
}
class PaymentGetlistSuccessEvent extends PaymentState {
  PaymentGetlistSuccessEvent({required List<PaymentModel> payment}) : super(payment: payment);
}

class PaymentDeleteSuccessState extends PaymentState {
  PaymentDeleteSuccessState({required List<PaymentModel> payment})
      : super(payment: payment);
}

class PaymentDeleteErrorState extends PaymentState {
  PaymentDeleteErrorState({required List<PaymentModel> payment})
      : super(payment: payment);
}
class PaymentSearchState extends PaymentState {
  PaymentSearchState({required List<PaymentModel> payment})
      : super(payment: payment);
}