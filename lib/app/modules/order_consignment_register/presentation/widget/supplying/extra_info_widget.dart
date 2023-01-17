import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/divida_atual_supplying_widget.dart';
import 'package:flutter/material.dart';

Widget extrainfo(OrderConsignmentSupplyingModel modelSupplying, Size size) {
  return SizedBox(
    height: size.height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: size.height - 170,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: TextField(
              enabled: true,
              focusNode: null,
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.none,
              controller:
                  TextEditingController(text: modelSupplying.order.note),
              onChanged: (value) => {
                modelSupplying.order.note = value,
              },
            ),
          ),
        ),
        dividaatualsupplying(modelSupplying),
      ],
    ),
  );
}
