import 'package:appweb/app/core/shared/utils/function.dart';
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
  late TextEditingController _controller;

  String _textForItem(OrderSaleCardModel item, int position) {
    switch (position) {
      case 1:
        return (item.bonus > 0) ? item.bonus.toStringAsFixed(0) : "";
      case 2:
        return item.nameProduct;
      case 3:
        return (item.sale > 0) ? item.sale.toStringAsFixed(0) : "";
      case 4:
        return (item.subtotal > 0) ? floatToStrF(item.subtotal) : "";
    }
    return "";
  }

  @override
  void initState() {
    super.initState();
    _controller =
        TextEditingController(text: _textForItem(widget.item, widget.position));
  }

  @override
  void didUpdateWidget(FieldItemOrdersale oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Atualiza o controller somente se o campo não estiver em foco,
    // para não interromper a digitação em andamento.
    if (!widget.focus.hasFocus) {
      final newText = _textForItem(widget.item, widget.position);
      if (_controller.text != newText) {
        _controller.text = newText;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          ),
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
                        double.parse((widget.item.sale * widget.item.unitValue)
                            .toStringAsFixed(2));
                  } else {
                    widget.item.subtotal = 0;
                  }
                }
                break;
            }
          },
          controller: _controller,
        ),
      ),
    );
  }
}
