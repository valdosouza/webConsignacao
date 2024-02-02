import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfopixhistoric(OrderConsignmentCheckpointModel modelCheckpoint) {
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: headerfield('Pix', 32),
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
          child: TextFormField(
            initialValue: modelCheckpoint.payments[1].value.toStringAsFixed(2),
            enabled: false,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    ],
  );
}
