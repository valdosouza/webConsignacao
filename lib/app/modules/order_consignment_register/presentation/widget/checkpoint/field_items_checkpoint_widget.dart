import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:flutter/material.dart';

Widget fielditemscheckpoint(OrderConsignmentCheckpointCardModel item,
    int position, bool enabled, int decimal, TextAlign textAlign) {
  String setTextController(
      OrderConsignmentCheckpointCardModel item, int position) {
    switch (position) {
      case 1:
        return item.bonus.toStringAsFixed(0);
      case 2:
        return item.nameProduct;
      case 3:
        return item.qtyConsigned.toStringAsFixed(0);
      case 4:
        if (item.leftover == item.qtyConsigned) {
          return item.leftover.toStringAsFixed(0);
        }
        return (item.qtySold > 0) ? item.leftover.toStringAsFixed(0) : "";
      case 5:
        return (item.qtySold > 0) ? item.qtySold.toStringAsFixed(0) : "";
      case 6:
        return (item.subtotal > 0) ? item.subtotal.toStringAsFixed(2) : "";
    }
    return "";
  }

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
        keyboardType: TextInputType.number,
        textAlign: textAlign,
        onSubmitted: (value) {
          if (value.isEmpty) value = "0";
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
              if (value.isNotEmpty) {
                item.leftover = double.parse(value);
                item.qtySold = (item.qtyConsigned - item.leftover);
                if (item.unitValue == 0) item.unitValue = 1;
                item.subtotal =
                    (item.qtyConsigned - item.leftover) * item.unitValue;
              } else {
                item.leftover = 0;
                item.qtySold = 0;
                item.subtotal = 0;
              }
              break;
          }
        },
        controller:
            TextEditingController(text: setTextController(item, position)),
      ),
    ),
  );
}
