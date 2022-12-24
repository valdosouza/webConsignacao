import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfotroco(OrderConsignmentCheckpointModel modelCheckpoint) {
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
                text: (modelCheckpoint.items
                                .map((e) => ((e.qtyConsigned - e.leftover) *
                                    e.unitValue))
                                .reduce((value, element) => value + element) +
                            modelCheckpoint.order.previousDebiBalance -
                            modelCheckpoint.payments[0].value -
                            modelCheckpoint.payments[1].value) <
                        0
                    ? (modelCheckpoint.items
                                .map((e) => ((e.qtyConsigned - e.leftover) *
                                    e.unitValue))
                                .reduce((value, element) => value + element) +
                            modelCheckpoint.order.previousDebiBalance -
                            modelCheckpoint.payments[0].value -
                            modelCheckpoint.payments[1].value)
                        .toStringAsFixed(2)
                    : "0.00"),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    ],
  );
}
