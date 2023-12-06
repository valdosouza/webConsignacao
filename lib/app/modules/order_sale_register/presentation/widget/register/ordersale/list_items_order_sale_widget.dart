import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/field_items_order_sale_widget.dart';
import 'package:flutter/material.dart';

Widget listitemsordersale(
    List<OrderSaleCardModel> items, Size size, BuildContext context) {
  final focusNodes = List.generate(items.length * 4, (index) => FocusNode());
  int contador = 1;
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: FieldItemOrdersale(
              item: items[index],
              position: 1,
              enabled: true,
              textAlign: TextAlign.center,
              focus: focusNodes[(index + contador) - 1],
              listNode: focusNodes,
            ),
          ),
          Expanded(
            flex: 4,
            child: FieldItemOrdersale(
              item: items[index],
              position: 2,
              enabled: false,
              textAlign: TextAlign.left,
              focus: focusNodes[(index + (contador += 1)) - 1],
              listNode: focusNodes,
            ),
          ),
          Expanded(
            flex: 3,
            child: FieldItemOrdersale(
              item: items[index],
              position: 3,
              enabled: true,
              textAlign: TextAlign.center,
              focus: focusNodes[(index + (contador += 1)) - 1],
              listNode: focusNodes,
            ),
          ),
          Expanded(
            flex: 3,
            child: FieldItemOrdersale(
              item: items[index],
              position: 4,
              enabled: false,
              textAlign: TextAlign.right,
              focus: focusNodes[(index + (contador += 1)) - 1],
              listNode: focusNodes,
            ),
          ),
        ],
      ),
    ),
  );
}
