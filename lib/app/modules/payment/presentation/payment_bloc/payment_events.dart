import 'package:appweb/app/modules/payment/data/model/payment_model.dart';

abstract class PaymentEvent {}

class PaymentGetlistEvent extends PaymentEvent {
  final int idInstitution;
  PaymentGetlistEvent({required this.idInstitution});
}

class PaymentSearchEvent extends PaymentEvent {
  final String search;
  PaymentSearchEvent({required this.search});
}

class PaymentDeleteEvent extends PaymentEvent {
  final int idPayment;
  PaymentDeleteEvent({required this.idPayment});
}

class PaymentAddEvent extends PaymentEvent {
  final PaymentModel paymentModel;
  PaymentAddEvent({required this.paymentModel});
}

class PaymentPutEvent extends PaymentEvent {
  final PaymentModel paymentModel;
  PaymentPutEvent({required this.paymentModel});
}
