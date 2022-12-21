import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/list_field_item_widget.dart';
import 'package:flutter/material.dart';

Widget listitemsview(
    List<OrderConsignmentCheckpointItemsModel> items, Size size) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Expanded(
            flex: 200,
            child: listfielditems(items[index], 1, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 400,
            child: listfielditems(items[index], 2, false, 0, TextAlign.left),
          ),
          Expanded(
            flex: 270,
            child: listfielditems(items[index], 3, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 200,
            child: listfielditems(items[index], 4, true, 0, TextAlign.center),
          ),
          Expanded(
            flex: 315,
            child: listfielditems(items[index], 5, false, 2, TextAlign.right),
          ),
          Expanded(
            flex: 300,
            child: listfielditems(items[index], 6, false, 2, TextAlign.right),
          ),
        ],
      ),
    ),
  );
}
