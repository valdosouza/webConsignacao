import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:flutter/material.dart';

Widget fielditemsordersale(OrderSaleCardModel item, int position, bool enabled,
    int decimal, TextAlign textAlign) {
  String setTextController(OrderSaleCardModel item, int position) {
    switch (position) {
      case 1:
        return (item.bonus > 0) ? item.bonus.toStringAsFixed(0) : "";
      case 2:
        return item.nameProduct;
      case 3:
        return (item.sale > 0) ? item.sale.toStringAsFixed(0) : "";
      case 4:
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
              if (value.isNotEmpty) {
                item.sale = double.parse(value);
                if (item.sale > 0) {
                  item.subtotal = item.sale * item.unitValue;
                } else {
                  item.subtotal = 0;
                }
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
