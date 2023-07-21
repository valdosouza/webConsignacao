import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';

abstract class OrderSaleRegisterEvent {}

class OrderSaleRegisterGetCardEvent extends OrderSaleRegisterEvent {
  int tbPriceListId;
  OrderSaleRegisterGetCardEvent({
    required this.tbPriceListId,
  });
}

class OrderSaleCardPostEvent extends OrderSaleRegisterEvent {
  final OrderSaleMainCardModel model;

  OrderSaleCardPostEvent({required this.model});
}

class OrderSaleRegisterClearEvent extends OrderSaleRegisterEvent {}
