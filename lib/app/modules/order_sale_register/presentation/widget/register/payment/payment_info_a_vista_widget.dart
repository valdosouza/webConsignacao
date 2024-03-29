import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/payment/payment_info_dinheiro_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/payment/payment_info_pix_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/payment/payment_info_troco_widget.dart';

import 'package:flutter/material.dart';

Widget paymentAVista(OrderSaleMainCardModel modelOrderSale) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      PaymentInfoCash(modelOrderPaid: modelOrderSale.payments),
      paymentinfopix(modelOrderSale.payments),
      paymentinfotroco(modelOrderSale),
    ],
  );
}
