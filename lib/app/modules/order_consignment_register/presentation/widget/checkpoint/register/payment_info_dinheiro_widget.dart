import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfodinheiro(OrderConsignmentCheckpointModel modelCheckpoint) {
  var txt = TextEditingController(
      text: (modelCheckpoint.payments[0].value > 0)
          ? floatToStrF(modelCheckpoint.payments[0].value)
          : "");
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: headerfield('Dinheiro', 32),
      ),
      Expanded(
        flex: 4,
        child: Container(
          height: 33,
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
                modelCheckpoint.payments[0].value = double.parse(value);
              } else {
                modelCheckpoint.payments[0].value = 0.0;
              }
            },
          ),
        ),
      ),
    ],
  );
}
