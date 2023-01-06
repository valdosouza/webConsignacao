import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_main_card_model.dart';

abstract class OrderSaleRegisterEvent {}

class OrderSaleRegisterGetItemsPreSaleEvent extends OrderSaleRegisterEvent {
  int tbInstitutionId;
  int tbPriceListId;
  OrderSaleRegisterGetItemsPreSaleEvent({
    required this.tbInstitutionId,
    required this.tbPriceListId,
  });
}

class OrderSaleRegisterPostEvent extends OrderSaleRegisterEvent {
  final OrderSaleMainCardModel model;

  OrderSaleRegisterPostEvent({required this.model});
}

class OrderSaleRegisterClearEvent extends OrderSaleRegisterEvent {}
