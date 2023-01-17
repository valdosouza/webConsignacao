import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/ordersale/field_items_order_sale_widget.dart';
import 'package:flutter/material.dart';

Widget listitemsordersale(List<OrderSaleCardModel> items, Size size) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child:
                fielditemsordersale(items[index], 1, true, 0, TextAlign.center),
          ),
          Expanded(
            flex: 4,
            child:
                fielditemsordersale(items[index], 2, false, 0, TextAlign.left),
          ),
          Expanded(
            flex: 3,
            child:
                fielditemsordersale(items[index], 3, true, 0, TextAlign.center),
          ),
          Expanded(
            flex: 3,
            child:
                fielditemsordersale(items[index], 4, false, 0, TextAlign.right),
          ),
        ],
      ),
    ),
  );
}
