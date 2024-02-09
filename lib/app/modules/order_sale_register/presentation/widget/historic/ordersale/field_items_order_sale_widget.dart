import 'package:flutter/material.dart';

import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';

class FieldItemOrdersale extends StatefulWidget {
  final OrderSaleCardModel item;
  final int position;
  final bool enabled;

  final TextAlign textAlign;
  final FocusNode focus;
  final List<FocusNode> listNode;
  const FieldItemOrdersale({
    super.key,
    required this.item,
    required this.position,
    required this.enabled,
    required this.textAlign,
    required this.focus,
    required this.listNode,
  });

  @override
  State<FieldItemOrdersale> createState() => _FieldItemOrdersaleState();
}

class _FieldItemOrdersaleState extends State<FieldItemOrdersale> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      margin:
          const EdgeInsets.only(left: 3.0, top: 0.0, right: 3.0, bottom: 0.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: TextField(
          focusNode: widget.focus,
          enabled: widget.enabled,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          textAlign: widget.textAlign,
          onSubmitted: (value) {
            if (value.isEmpty) value = "0";
            switch (widget.position) {
              case 1:
                widget.item.bonus = double.parse(value);
                break;
              case 2:
                widget.item.nameProduct = value;
                break;
              case 3:
                if (value.isNotEmpty) {
                  widget.item.sale = double.parse(value);
                  if (widget.item.sale > 0) {
                    widget.item.subtotal =
                        widget.item.sale * widget.item.unitValue;
                  } else {
                    widget.item.subtotal = 0;
                  }
                }
                break;
            }
          },
          controller: TextEditingController(
              text: setTextController(widget.item, widget.position)),
        ),
      ),
    );
  }
}
