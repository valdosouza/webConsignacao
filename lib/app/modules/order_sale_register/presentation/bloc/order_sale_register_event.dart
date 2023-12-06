import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';

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

class ReturnToOrderSaleEvent extends OrderSaleRegisterEvent {}

class ReturnToAttendanceEvent extends OrderSaleRegisterEvent {}

class SearchEvent extends OrderSaleRegisterEvent {
  String search;

  SearchEvent({
    required this.search,
  });
}

class GetOrderSaleCardEvent extends OrderSaleRegisterEvent {
  int orderid;
  GetOrderSaleCardEvent({
    required this.orderid,
  });
}

//============================historic=================================
class OrderSaleRegisterGetlistEvent extends OrderSaleRegisterEvent {
  final ParamsOrderSaleList params;
  OrderSaleRegisterGetlistEvent({
    required this.params,
  });
}

class OrderGetBackToGetlistEvent extends OrderSaleRegisterEvent {}
