import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:flutter/material.dart';

Widget paymentinfodinheiro(OrderConsignmentCheckpointModel modelCheckpoint) {
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: const Text(
            "Dinheiro",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            controller: TextEditingController(
                text: modelCheckpoint.payments[0].value.toString()),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onSubmitted: (value) {
              modelCheckpoint.payments[0].value = double.parse(value);
            },
          ),
        ),
      ),
    ],
  );
}
