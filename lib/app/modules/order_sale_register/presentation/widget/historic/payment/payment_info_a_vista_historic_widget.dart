import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/historic/payment/payment_info_dinheiro_historic_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/historic/payment/payment_info_pix_historic_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/historic/payment/payment_info_troco_historic_widget.dart';

import 'package:flutter/material.dart';

Widget paymentAVistaHistoric(OrderSaleMainCardModel modelOrderSale) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      PaymentInfoCashHistoric(modelOrderPaid: modelOrderSale.payments),
      paymentinfopixHistoric(modelOrderSale.payments),
      paymentinfotrocoHistoric(modelOrderSale),
    ],
  );
}
