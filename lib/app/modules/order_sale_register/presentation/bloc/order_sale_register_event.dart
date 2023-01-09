import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_main_card_model.dart';

abstract class OrderSaleRegisterEvent {}

class OrderSaleRegisterGetCardEvent extends OrderSaleRegisterEvent {
  int tbInstitutionId;
  int tbPriceListId;
  OrderSaleRegisterGetCardEvent({
    required this.tbInstitutionId,
    required this.tbPriceListId,
  });
}

class OrderSaleCardPostEvent extends OrderSaleRegisterEvent {
  final OrderSaleMainCardModel model;

  OrderSaleCardPostEvent({required this.model});
}

class OrderSaleRegisterClearEvent extends OrderSaleRegisterEvent {}
