import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/historic/payment/payment_info_a_vista_historic_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/historic/payment/payment_info_boleto_historic_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/historic/payment/payment_info_price_list_historic_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfoHistoric(OrderSaleMainCardModel modelOrdersale) {
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
            controller: TextEditingController(
                text: modelOrdersale.order.totalValue.toStringAsFixed(2)),
            textAlign: TextAlign.center,
          ),
        ),
        (modelOrdersale.payments.length == 1)
            ? paymentBoletoHistoric(modelOrdersale)
            : paymentAVistaHistoric(modelOrdersale),
        const SizedBox(height: 15),
        paymentInfoPriceListHistoric(modelOrdersale),
      ],
    ),
  );
}
