import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:flutter/material.dart';

Widget paymentinfosaldodevedor(
    OrderConsignmentCheckpointModel modelCheckpoint) {
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
            "Saldo Devedor",
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
          child: Text(
            (modelCheckpoint.items
                            .map((e) =>
                                ((e.qtyConsigned - e.leftover) * e.unitValue))
                            .reduce((value, element) => value + element) +
                        modelCheckpoint.order.debitBalance -
                        modelCheckpoint.payments[0].value -
                        modelCheckpoint.payments[1].value) >
                    0
                ? (modelCheckpoint.items
                            .map((e) =>
                                ((e.qtyConsigned - e.leftover) * e.unitValue))
                            .reduce((value, element) => value + element) +
                        modelCheckpoint.order.debitBalance -
                        modelCheckpoint.payments[0].value -
                        modelCheckpoint.payments[1].value)
                    .toString()
                : "0.00",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}
