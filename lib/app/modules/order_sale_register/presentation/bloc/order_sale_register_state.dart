import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_main_card_model.dart';

abstract class OrderSaleRegisterState {}

class OrderSaleRegisterLoadingState extends OrderSaleRegisterState {}

class OrderSaleRegisterGetItemsErrorState extends OrderSaleRegisterState {
  final String error;

  OrderSaleRegisterGetItemsErrorState(this.error);
}

class OrderSaleRegisterGetItemsPreSaleLoadedState
    extends OrderSaleRegisterState {
  OrderSaleMainCardModel model;

  OrderSaleRegisterGetItemsPreSaleLoadedState({
    required this.model,
  });
}

class OrderSaleRegisterPostErrorState extends OrderSaleRegisterState {
  final String error;
  OrderSaleRegisterPostErrorState({
    required this.error,
  });
}

class OrderSaleRegisterPostSucessState extends OrderSaleRegisterState {
  final OrderSaleMainCardModel ordermodel;

  OrderSaleRegisterPostSucessState({required this.ordermodel});
}

class OrderSaleRegisterCalcDoneState extends OrderSaleRegisterState {}
