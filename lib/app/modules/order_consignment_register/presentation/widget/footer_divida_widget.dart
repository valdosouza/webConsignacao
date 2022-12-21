import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/list_field_widget.dart';
import 'package:flutter/material.dart';

Widget footterDivida(OrderConsignmentCheckpointModel checkpointmodel) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    margin: const EdgeInsets.only(left: 1.0, top: 0.0, right: 1.0, bottom: 0.0),
    child: Row(
      children: [
        Expanded(
          flex: 5,
          child: headerfield('Divida Velha'),
        ),
        Expanded(
          flex: 2,
          child:
              fieldedit(checkpointmodel.order.debitBalance.toString(), false),
        ),
      ],
    ),
  );
}
