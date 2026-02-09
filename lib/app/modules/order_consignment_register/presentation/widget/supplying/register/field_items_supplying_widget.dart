import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:flutter/material.dart';

Widget fielditemssupplying(BuildContext context,
    OrderConsignmentSupplyingCardModel item,
    int position,
    bool enabled,
    int decimal,
    TextAlign textAlign) {
  String setTextController() {
    switch (position) {
      case 1:
        return (item.bonus > 0) ? item.bonus.toStringAsFixed(0) : "";
      case 2:
        return item.nameProduct;
      case 3:
        return (item.leftover > 0) ? item.leftover.toStringAsFixed(0) : "";
      case 4:
        return (item.devolution > 0) ? item.devolution.toStringAsFixed(0) : "";
      case 5:
        return (item.newConsignment > 0)
            ? item.newConsignment.toStringAsFixed(0)
            : "";

      case 6:
        return (item.qttyConsigned > 0)
            ? item.qttyConsigned.toStringAsFixed(0)
            : "";
    }
    return "";
  }

  return Container(
    height: 28,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 3.0, top: 0.0, right: 3.0, bottom: 0.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    child: TextField(
      enabled: enabled,
      keyboardType: TextInputType.number,
      textAlign: textAlign,
      textAlignVertical: TextAlignVertical.center,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.black,
            fontSize: 12,
          ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      ),
      onSubmitted: (value) {
        if (value.isEmpty) value = "0";
        switch (position) {
          case 1:
            if (value.isNotEmpty) item.bonus = double.parse(value);
            break;
          case 2:
            item.nameProduct = value;
            break;
          case 3:
            item.leftover = double.parse(value);
            break;
          case 4:
            if (item.leftover > 0) {
              item.devolution = double.parse(value);
              if (item.devolution > item.leftover) {
                item.devolution = item.leftover;
              }
            } else {
              item.devolution = 0;
            }
            item.qttyConsigned =
                item.newConsignment + (item.leftover - item.devolution);

            break;
          case 5:
            item.newConsignment = double.parse(value);
            item.qttyConsigned =
                item.newConsignment + (item.leftover - item.devolution);

            break;
        }
      },
      controller: TextEditingController(
        text: setTextController(),
      ),
      onTap: () {
        TextEditingController().selection = TextSelection(
            baseOffset: 0, extentOffset: TextEditingController().text.length);
      },
    ),
  );
}
