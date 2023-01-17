import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/ordersale/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentInfoPriceList(OrderSaleMainCardModel modelOrderSale) {
  return Center(
    child: (modelOrderSale.payments[0].tbPaymentTypeId == 1)
        ? headerfield('À Vista')
        : headerfield('Boleto'),
  );
}
