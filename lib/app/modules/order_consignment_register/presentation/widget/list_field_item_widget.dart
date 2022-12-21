import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:flutter/material.dart';

Widget listfielditems(OrderConsignmentCheckpointItemsModel item, int position,
    bool enabled, int decimal, TextAlign textAlign) {
  return Container(
    height: 30,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 3.0, top: 0.0, right: 3.0, bottom: 0.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: TextField(
        enabled: enabled,
        controller: TextEditingController(
          text: (position == 2)
              ? item.nameProduct
              : ((item.qtyConsigned - item.leftover) * item.unitValue)
                  .toStringAsFixed(decimal),
        ),
        keyboardType: TextInputType.number,
        textAlign: textAlign,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            switch (position) {
              case 1:
                item.bonus = double.parse(value);
                break;
              case 2:
                item.nameProduct = value;
                break;
              case 3:
                item.qtyConsigned = double.parse(value);

                break;
              case 4:
                item.leftover = double.parse(value);
                break;
              case 5:
                item.qtySold = (item.qtyConsigned - item.leftover);
                break;
              case 6:
                item.subtotal = item.qtySold * item.unitValue;
                break;
            }
          }
        },
      ),
    ),
  );
}
