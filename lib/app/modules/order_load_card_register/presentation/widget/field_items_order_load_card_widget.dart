import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:flutter/material.dart';

Widget fielditemsorderLoadCard(OrderLoadCardItemsModel item, int position,
    bool enabled, int decimal, TextAlign textAlign) {
  String setTextController(OrderLoadCardItemsModel item, int position) {
    switch (position) {
      case 1:
        return item.nameProduct;
      case 2:
        double dayBalance = item.stockBalance + item.bonus + item.sale;
        return dayBalance.toStringAsFixed(0);
      case 3:
        return item.sale.toStringAsFixed(0);
      case 4:
        return item.bonus.toStringAsFixed(0);
      case 5:
        return (item.adjust > 0) ? item.adjust.toStringAsFixed(0) : "";
      case 6:
        return (item.newLoad > 0) ? item.newLoad.toStringAsFixed(0) : "";
      case 7:
        double currentBalance =
            (item.stockBalance + item.newLoad) - item.adjust;
        return (currentBalance > 0) ? currentBalance.toStringAsFixed(0) : "";
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
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          height: 10,
        ),
        enabled: enabled,
        keyboardType: TextInputType.number,
        textAlign: textAlign,
        onSubmitted: (value) {
          if (value.isEmpty) value = "0";
          switch (position) {
            case 5:
              item.adjust = double.parse(value);
              break;
            case 6:
              item.newLoad = double.parse(value);
              break;
          }
        },
        controller:
            TextEditingController(text: setTextController(item, position)),
      ),
    ),
  );
}
