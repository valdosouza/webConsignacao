import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/field_items_supplying_widget.dart';
import 'package:flutter/material.dart';

Widget listitemssupplying(
    List<OrderConsignmentSupplyingCardModel> items, Size size) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Expanded(
            flex: 190,
            child:
                fielditemssupplying(items[index], 1, true, 0, TextAlign.center),
          ),
          Expanded(
            flex: 380,
            child:
                fielditemssupplying(items[index], 2, false, 0, TextAlign.left),
          ),
          Expanded(
            flex: 190,
            child: fielditemssupplying(
                items[index], 3, false, 0, TextAlign.center),
          ),
          Expanded(
            flex: 240,
            child:
                fielditemssupplying(items[index], 4, true, 0, TextAlign.center),
          ),
          Expanded(
            flex: 315,
            child:
                fielditemssupplying(items[index], 5, true, 2, TextAlign.center),
          ),
          Expanded(
            flex: 270,
            child: fielditemssupplying(
                items[index], 6, false, 2, TextAlign.center),
          ),
        ],
      ),
    ),
  );
}
