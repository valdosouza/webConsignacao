import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/payment/payment_info_a_vista_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/payment/payment_info_boleto_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/payment/payment_info_price_list_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfo(BuildContext context, OrderSaleMainCardModel modelOrdersale) {
  String calcInfoPayment() {
    modelOrdersale.order.totalValue = 0;
    for (OrderSaleCardModel item in modelOrdersale.items) {
      modelOrdersale.order.totalValue += (item.sale * item.unitValue);
    }
    // Arredonda para 2 casas para evitar drift de ponto flutuante na comparação posterior
    modelOrdersale.order.totalValue =
        double.parse(modelOrdersale.order.totalValue.toStringAsFixed(2));
    return floatToStrF(modelOrdersale.order.totalValue);
  }

  return Container(
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    child: SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              ),
            ),
          ),
          (modelOrdersale.payments.length == 1)
              ? PaymentBoleto(modelOrdersale: modelOrdersale)
              : paymentAVista(modelOrdersale),
          const SizedBox(height: 15),
          paymentInfoPriceList(modelOrdersale),
        ],
      ),
    ),
  );
}
