import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';

abstract class PaymentTypeEvent {}

class LoadPaymentTypeEvent extends PaymentTypeEvent {}

class AddPaymentTypeEvent extends PaymentTypeEvent {
  PaymentTypeModel paymentType;

  AddPaymentTypeEvent({
    required this.paymentType,
  });
}

class EditPaymentTypeEvent extends PaymentTypeEvent {
  PaymentTypeModel paymentType;

  EditPaymentTypeEvent({
    required this.paymentType,
  });
}

class SearchPaymentTypeEvent extends PaymentTypeEvent {
  String search;

  SearchPaymentTypeEvent({
    required this.search,
  });
}

class DeletePaymentTypeEvent extends PaymentTypeEvent {
  int paymentId;

  DeletePaymentTypeEvent({
    required this.paymentId,
  });
}

class PaymentTypeInterationEvent extends PaymentTypeEvent {
  PaymentTypeModel? paymentType;

  PaymentTypeInterationEvent({
    this.paymentType,
  });
}
