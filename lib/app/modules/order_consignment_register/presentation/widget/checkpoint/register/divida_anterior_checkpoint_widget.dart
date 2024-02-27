import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/field_edit_widget.dart';
import 'package:flutter/material.dart';

Widget dividaanteriorcheckpoint(
    OrderConsignmentCheckpointModel checkpointmodel) {
  return Container(
    alignment: Alignment.center,
    child: Row(
      children: [
        Expanded(
          flex: 5,
          child: headerfield('Div. Anterior', 33),
        ),
        Expanded(
          flex: 4,
          child: fieldedit(
              floatToStrF(checkpointmodel.order.previousDebiBalance), false),
        ),
      ],
    ),
  );
}
