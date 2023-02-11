import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/field_items_order_load_card_widget.dart';
import 'package:flutter/material.dart';

Widget listitemsorderLoadCard(List<OrderLoadCardItemsModel> items) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Expanded(
            flex: 500,
            child: fielditemsorderLoadCard(
                items[index], 1, false, 0, TextAlign.left),
          ),
          Expanded(
            flex: 250,
            child: fielditemsorderLoadCard(
                items[index], 2, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 250,
            child: fielditemsorderLoadCard(
                items[index], 3, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 250,
            child: fielditemsorderLoadCard(
                items[index], 4, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 250,
            child: fielditemsorderLoadCard(
                items[index], 5, (items[index].id == 0), 0, TextAlign.center),
          ),
          Expanded(
            flex: 250,
            child: fielditemsorderLoadCard(
                items[index], 6, (items[index].id == 0), 0, TextAlign.center),
          ),
          Expanded(
            flex: 250,
            child: fielditemsorderLoadCard(
                items[index], 7, false, 0, TextAlign.center),
          ),
        ],
      ),
    ),
  );
}
