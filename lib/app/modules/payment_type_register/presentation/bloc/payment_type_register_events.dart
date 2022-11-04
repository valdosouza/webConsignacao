import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';

abstract class PaymentTypeRegisterEvent {}

class PaymentTypeRegisterGetListEvent extends PaymentTypeRegisterEvent {}

class PaymentTypeRegisterSearchEvent extends PaymentTypeRegisterEvent {
  String search;

  PaymentTypeRegisterSearchEvent({
    required this.search,
  });
}

class PaymentTypeRegisterPutEvent extends PaymentTypeRegisterEvent {
  final PaymentTypeModel model;

  PaymentTypeRegisterPutEvent({required this.model});
}

class PaymentTypeRegisterPostEvent extends PaymentTypeRegisterEvent {
  final PaymentTypeModel model;

  PaymentTypeRegisterPostEvent({required this.model});
}

class PaymentTypeRegisterInfoEvent extends PaymentTypeRegisterEvent {
  final PaymentTypeModel? model;
  PaymentTypeRegisterInfoEvent({this.model});
}
