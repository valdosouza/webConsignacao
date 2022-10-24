import 'package:appweb/app/modules/payment_type_register/data/model/payment_model.dart';

abstract class PaymentTypeEvent {}

class PaymentTypeGetlistEvent extends PaymentTypeEvent {
  final int idInstitution;
  PaymentTypeGetlistEvent({required this.idInstitution});
}

class PaymentTypeSearchEvent extends PaymentTypeEvent {
  final String search;
  PaymentTypeSearchEvent({required this.search});
}

class PaymentTypeDeleteEvent extends PaymentTypeEvent {
  final int idPayment;
  PaymentTypeDeleteEvent({required this.idPayment});
}

class PaymentTypeAddEvent extends PaymentTypeEvent {
  final PaymentTypeModel paymentTypeModel;
  PaymentTypeAddEvent({required this.paymentTypeModel});
}

class PaymentTypePutEvent extends PaymentTypeEvent {
  final PaymentTypeModel paymentTypeModel;
  PaymentTypePutEvent({required this.paymentTypeModel});
}
