import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfotrocoHistoric(OrderSaleMainCardModel modelOrderSale) {
  String calcChange() {
    double totalpayment = 0;
    double totalcash = 0;
    double totalChange = 0;
    for (var item in modelOrderSale.payments) {
      totalpayment += item.value;
      if (item.namePaymentType == "DINHEIRO") totalcash += item.value;
    }
    if (modelOrderSale.order.totalValue > 0) {
      if (totalpayment > modelOrderSale.order.totalValue) {
        if (totalcash > 0) {
          modelOrderSale.order.changeValue = 0;
          totalChange = totalpayment - modelOrderSale.order.totalValue;
          if (totalcash > totalChange) {
            modelOrderSale.order.changeValue = totalChange;
            return modelOrderSale.order.changeValue.toStringAsFixed(2);
          }
        }
      }
    }
    return "";
  }

  return Row(
    children: [
      Expanded(
        flex: 5,
        child: headerfield('Troco'),
      ),
      Expanded(
        flex: 4,
        child: Container(
          height: 35,
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(
              left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            enabled: false,
            controller: TextEditingController(
              text: calcChange(),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    ],
  );
}
