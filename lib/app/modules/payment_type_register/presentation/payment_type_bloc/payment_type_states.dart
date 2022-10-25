import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';

abstract class PaymentTypeState {
  List<PaymentTypeModel> paymentTypeList;

  PaymentTypeState({
    required this.paymentTypeList,
  });
}

class PaymentTypeInitialState extends PaymentTypeState {
  PaymentTypeInitialState() : super(paymentTypeList: []);
}

class PaymentTypeSuccessState extends PaymentTypeState {
  PaymentTypeSuccessState({
    required List<PaymentTypeModel> paymentTypeList,
  }) : super(paymentTypeList: paymentTypeList);
}

class PaymentTypeEditSuccessState extends PaymentTypeState {
  PaymentTypeEditSuccessState({required List<PaymentTypeModel> paymentTypeList})
      : super(paymentTypeList: paymentTypeList);
}

class PaymentTypeAddSuccessState extends PaymentTypeState {
  PaymentTypeAddSuccessState({required List<PaymentTypeModel> paymentTypeList})
      : super(paymentTypeList: paymentTypeList);
}

class PaymentTypePutErrorState extends PaymentTypeState {
  PaymentTypePutErrorState({required List<PaymentTypeModel> paymentTypeList})
      : super(paymentTypeList: paymentTypeList);
}

class PaymentTypeAddErrorState extends PaymentTypeState {
  PaymentTypeAddErrorState({required List<PaymentTypeModel> paymentTypeList})
      : super(paymentTypeList: paymentTypeList);
}

class PaymentTypeErrorState extends PaymentTypeState {
  PaymentTypeErrorState() : super(paymentTypeList: []);
}

class PaymentTypeDeleteSuccessState extends PaymentTypeState {
  PaymentTypeDeleteSuccessState(
      {required List<PaymentTypeModel> paymentTypeList})
      : super(paymentTypeList: paymentTypeList);
}

class PaymentTypeDeleteErrorState extends PaymentTypeState {
  PaymentTypeDeleteErrorState({required List<PaymentTypeModel> paymentTypeList})
      : super(paymentTypeList: paymentTypeList);
}

class PaymentTypeInterationPageState extends PaymentTypeState {
  final PaymentTypeModel? paymentType;
  PaymentTypeInterationPageState({
    required List<PaymentTypeModel> paymentTypeList,
    this.paymentType,
  }) : super(paymentTypeList: paymentTypeList);
}
