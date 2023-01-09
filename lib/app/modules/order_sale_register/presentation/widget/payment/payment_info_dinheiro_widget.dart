import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/ordersale/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfodinheiro(List<OrderPaidModel> modelOrderPaid) {
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: headerfield('Dinheiro'),
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
            controller: TextEditingController(
                text: modelOrderPaid[0].value.toStringAsFixed(2)),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            onSubmitted: (value) {
              modelOrderPaid[0].value = double.parse(value);
            },
          ),
        ),
      ),
    ],
  );
}
