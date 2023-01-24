import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/payment/payment_info_a_vista_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/payment/payment_info_boleto_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/payment/payment_info_price_list_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfo(OrderSaleMainCardModel modelOrdersale) {
  String calcInfoPayment() {
    modelOrdersale.order.totalValue = 0;
    for (OrderSaleCardModel item in modelOrdersale.items) {
      modelOrdersale.order.totalValue += (item.qttySold * item.unitValue);
    }
    return modelOrdersale.order.totalValue.toStringAsFixed(2);
  }

  return Container(
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            enabled: false,
            controller: TextEditingController(text: calcInfoPayment()),
            textAlign: TextAlign.center,
          ),
        ),
        (modelOrdersale.payments.length == 1)
            ? paymentBoleto(modelOrdersale)
            : paymentAVista(modelOrdersale),
        const SizedBox(height: 15),
        paymentInfoPriceList(modelOrdersale),
      ],
    ),
  );
}
