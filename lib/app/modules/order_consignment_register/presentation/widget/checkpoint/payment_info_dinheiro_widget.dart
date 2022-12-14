import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfodinheiro(OrderConsignmentCheckpointModel modelCheckpoint) {
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
                text: modelCheckpoint.payments[0].value.toStringAsFixed(2)),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            onSubmitted: (value) {
              modelCheckpoint.payments[0].value = double.parse(value);
            },
          ),
        ),
      ),
    ],
  );
}
