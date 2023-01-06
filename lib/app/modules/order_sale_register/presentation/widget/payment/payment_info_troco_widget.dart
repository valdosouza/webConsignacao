import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/ordersale/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfotroco(OrderSaleMainCardModel modelOrderSale) {
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
                text: (modelOrderSale.items
                                .map((e) => (e.sale * e.unitValue))
                                .reduce((value, element) => value + element) +
                            modelOrderSale.payments[0].value) <
                        0
                    ? (modelOrderSale.items
                                .map((e) => (e.sale * e.unitValue))
                                .reduce((value, element) => value + element) +
                            modelOrderSale.payments[0].value)
                        .toStringAsFixed(2)
                    : "0.00"),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    ],
  );
}
