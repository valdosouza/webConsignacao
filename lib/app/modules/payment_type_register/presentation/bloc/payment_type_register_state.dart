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
  PaymentTypeRegisterLoadedState({required super.list});
}

class PaymentTypeRegisterErrorState extends PaymentTypeRegisterState {
  PaymentTypeRegisterErrorState({required super.list});
}

class PaymentTypeRegisterInfoPageState extends PaymentTypeRegisterState {
  PaymentTypeRegisterInfoPageState({required super.list});
}

class PaymentTypeRegisterAddSuccessState extends PaymentTypeRegisterState {
  PaymentTypeRegisterAddSuccessState({required super.list});
}

class PaymentTypeRegisterAddErrorState extends PaymentTypeRegisterState {
  PaymentTypeRegisterAddErrorState({required super.list});
}

class PaymentTypeRegisterEditSuccessState extends PaymentTypeRegisterState {
  PaymentTypeRegisterEditSuccessState({required super.list});
}

class PaymentTypeRegisterEditErrorState extends PaymentTypeRegisterState {
  PaymentTypeRegisterEditErrorState({required super.list});
}
