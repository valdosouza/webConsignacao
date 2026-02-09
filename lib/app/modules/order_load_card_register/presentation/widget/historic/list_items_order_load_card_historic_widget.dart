import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/Register/field_items_order_load_card_widget.dart';
import 'package:flutter/material.dart';

Widget listitemsorderLoadCardHistoric(List<OrderLoadCardItemsModel> items) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: fielditemsorderLoadCard(
                context, items[index], 1, false, 0, TextAlign.left),
          ),
          Expanded(
            flex: 2,
            child: fielditemsorderLoadCard(
                context, items[index], 2, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: fielditemsorderLoadCard(
                context, items[index], 3, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: fielditemsorderLoadCard(
                context, items[index], 4, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: fielditemsorderLoadCard(
                context, items[index], 5, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: fielditemsorderLoadCard(
                context, items[index], 6, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: fielditemsorderLoadCard(
                context, items[index], 7, false, 0, TextAlign.center),
          ),
        ],
      ),
    ),
  );
}
