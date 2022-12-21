import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/field_edit_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget dividaatual(OrderConsignmentCheckpointModel modelCheckpoint) {
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: headerfield('Divida Atual'),
      ),
      Expanded(
        flex: 4,
        child: fieldedit(
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
            false),
      ),
    ],
  );
}
