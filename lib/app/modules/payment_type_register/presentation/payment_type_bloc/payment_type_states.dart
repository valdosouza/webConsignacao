import 'package:appweb/app/modules/payment_type_register/data/model/payment_model.dart';

abstract class PaymentTypeState {
  List<PaymentTypeModel> payment;

  PaymentTypeState({
    required this.payment,
  });
}

class PaymentInitialState extends PaymentTypeState {
  PaymentInitialState() : super(payment: []);
}

class PaymentSuccessState extends PaymentTypeState {
  PaymentSuccessState({
    required List<PaymentTypeModel> payment,
  }) : super(payment: payment);
}

class PaymentEditSuccessState extends PaymentTypeState {
  PaymentEditSuccessState({required List<PaymentTypeModel> payment})
      : super(payment: payment);
}

class PaymentAddSuccessState extends PaymentTypeState {
  PaymentAddSuccessState() : super(payment: []);
}

class PaymentPutErrorState extends PaymentTypeState {
  PaymentPutErrorState({required List<PaymentTypeModel> payment})
      : super(payment: payment);
}

class PaymentPutSuccessState extends PaymentTypeState {
  PaymentPutSuccessState() : super(payment: []);
}

class PaymentAddErrorState extends PaymentTypeState {
  PaymentAddErrorState({required List<PaymentTypeModel> payment})
      : super(payment: payment);
}

class PaymentGetlistErrorState extends PaymentTypeState {
  PaymentGetlistErrorState() : super(payment: []);
}

class PaymentGetlistSuccessEvent extends PaymentTypeState {
  PaymentGetlistSuccessEvent({required List<PaymentTypeModel> payment})
      : super(payment: payment);
}

class PaymentDeleteSuccessState extends PaymentTypeState {
  PaymentDeleteSuccessState({required List<PaymentTypeModel> payment})
      : super(payment: payment);
}

class PaymentDeleteErrorState extends PaymentTypeState {
  PaymentDeleteErrorState({required List<PaymentTypeModel> payment})
      : super(payment: payment);
}

class PaymentSearchState extends PaymentTypeState {
  PaymentSearchState({required List<PaymentTypeModel> payment})
      : super(payment: payment);
}
