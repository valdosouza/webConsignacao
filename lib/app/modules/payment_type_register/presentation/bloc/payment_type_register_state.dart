import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';

abstract class PaymentTypeRegisterState {
  List<PaymentTypeModel> list;

  PaymentTypeRegisterState({
    required this.list,
  });
}

class PaymentTypeRegisterLoadingState extends PaymentTypeRegisterState {
  PaymentTypeRegisterLoadingState() : super(list: []);
}

class PaymentTypeRegisterLoadedState extends PaymentTypeRegisterState {
  PaymentTypeRegisterLoadedState({required List<PaymentTypeModel> list})
      : super(list: list);
}

class PaymentTypeRegisterErrorState extends PaymentTypeRegisterState {
  PaymentTypeRegisterErrorState({required List<PaymentTypeModel> list})
      : super(list: list);
}

class PaymentTypeRegisterInfoPageState extends PaymentTypeRegisterState {
  PaymentTypeRegisterInfoPageState({required List<PaymentTypeModel> list})
      : super(list: list);
}

class PaymentTypeRegisterAddSuccessState extends PaymentTypeRegisterState {
  PaymentTypeRegisterAddSuccessState({required List<PaymentTypeModel> list})
      : super(list: list);
}

class PaymentTypeRegisterAddErrorState extends PaymentTypeRegisterState {
  PaymentTypeRegisterAddErrorState({required List<PaymentTypeModel> list})
      : super(list: list);
}

class PaymentTypeRegisterEditSuccessState extends PaymentTypeRegisterState {
  PaymentTypeRegisterEditSuccessState({required List<PaymentTypeModel> list})
      : super(list: list);
}

class PaymentTypeRegisterEditErrorState extends PaymentTypeRegisterState {
  PaymentTypeRegisterEditErrorState({required List<PaymentTypeModel> list})
      : super(list: list);
}
