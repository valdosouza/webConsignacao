import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/field_edit_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget dividaatualcheckpoint(OrderConsignmentCheckpointModel modelCheckpoint) {
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: headerfield('Dívida Atual'),
      ),
      Expanded(
        flex: 4,
        child: fieldedit(
            modelCheckpoint.order.currentDebitBalance.toStringAsFixed(2),
            false),
      ),
    ],
  );
}
