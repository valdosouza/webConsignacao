import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';

abstract class OrderSaleRegisterState {}

class OrderSaleRegisterLoadingState extends OrderSaleRegisterState {}

class OrderSaleGetNewCardListErrorState extends OrderSaleRegisterState {
  final String error;

  OrderSaleGetNewCardListErrorState(this.error);
}

class OrderSaleGetNewCardListLoadedState extends OrderSaleRegisterState {
  OrderSaleMainCardModel model;

  OrderSaleGetNewCardListLoadedState({
    required this.model,
  });
}

class OrderSaleCardPostErrorState extends OrderSaleRegisterState {
  final String error;
  OrderSaleCardPostErrorState({
    required this.error,
  });
}

class OrderSaleCardPostSucessState extends OrderSaleRegisterState {}

class OrderSaleRegisterCalcDoneState extends OrderSaleRegisterState {}

class OrderSaleRegisterCleanDoneState extends OrderSaleRegisterState {}
