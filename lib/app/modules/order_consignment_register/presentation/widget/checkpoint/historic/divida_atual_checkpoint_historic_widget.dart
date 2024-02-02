import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/field_edit_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget dividaatualcheckpointhistoric(
    OrderConsignmentCheckpointModel modelCheckpoint) {
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: headerfield('Dívida Atual', 32),
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
