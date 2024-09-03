import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfopix(List<OrderPaidModel> modelOrderPaid) {
  var txt = TextEditingController(
      text: (modelOrderPaid[1].value > 0)
          ? floatToStrF(modelOrderPaid[1].value)
          : "");
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: headerfield('Pix'),
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
            controller: txt,
            onChanged: (value) {
              if (value.isNotEmpty) {
                txt.text = autoDecimalPoint(value);
              }
              txt.selection = TextSelection.fromPosition(
                  TextPosition(offset: txt.text.length));
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                modelOrderPaid[1].value = double.parse(value);
              } else {
                modelOrderPaid[1].value = 0.0;
              }
            },
          ),
        ),
      ),
    ],
  );
}
