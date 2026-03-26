import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:flutter/material.dart';

class FieldItemSupplying extends StatefulWidget {
  final OrderConsignmentSupplyingCardModel item;
  final int position;
  final bool enabled;
  final int decimal;
  final TextAlign textAlign;
  final FocusNode focus;

  const FieldItemSupplying({
    super.key,
    required this.item,
    required this.position,
    required this.enabled,
    required this.decimal,
    required this.textAlign,
    required this.focus,
  });

  @override
  State<FieldItemSupplying> createState() => _FieldItemSupplyingState();
}

class _FieldItemSupplyingState extends State<FieldItemSupplying> {
  late TextEditingController _controller;

  String _textForItem(OrderConsignmentSupplyingCardModel item, int position) {
    switch (position) {
      case 1:
        return (item.bonus > 0) ? item.bonus.toStringAsFixed(0) : "";
      case 2:
        return item.nameProduct;
      case 3:
        return (item.leftover > 0) ? item.leftover.toStringAsFixed(0) : "";
      case 4:
        return (item.devolution > 0) ? item.devolution.toStringAsFixed(0) : "";
      case 5:
        return (item.newConsignment > 0)
            ? item.newConsignment.toStringAsFixed(0)
            : "";
      case 6:
        return (item.qttyConsigned > 0)
            ? item.qttyConsigned.toStringAsFixed(0)
            : "";
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
  void didUpdateWidget(FieldItemSupplying oldWidget) {
    super.didUpdateWidget(oldWidget);
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
      height: 28,
      alignment: Alignment.center,
      margin:
          const EdgeInsets.only(left: 3.0, top: 0.0, right: 3.0, bottom: 0.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        focusNode: widget.focus,
        enabled: widget.enabled,
        keyboardType: TextInputType.number,
        textAlign: widget.textAlign,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.black,
              fontSize: 12,
            ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        ),
        onTap: () {
          _controller.selection = TextSelection(
            baseOffset: 0,
            extentOffset: _controller.text.length,
          );
        },
        onSubmitted: (value) {
          if (value.isEmpty) value = "0";
          switch (widget.position) {
            case 1:
              if (value.isNotEmpty) widget.item.bonus = double.parse(value);
              break;
            case 2:
              widget.item.nameProduct = value;
              break;
            case 3:
              widget.item.leftover = double.parse(value);
              break;
            case 4:
              if (widget.item.leftover > 0) {
                widget.item.devolution = double.parse(value);
                if (widget.item.devolution > widget.item.leftover) {
                  widget.item.devolution = widget.item.leftover;
                }
              } else {
                widget.item.devolution = 0;
              }
              widget.item.qttyConsigned = widget.item.newConsignment +
                  (widget.item.leftover - widget.item.devolution);
              break;
            case 5:
              widget.item.newConsignment = double.parse(value);
              widget.item.qttyConsigned = widget.item.newConsignment +
                  (widget.item.leftover - widget.item.devolution);
              break;
          }
        },
        controller: _controller,
      ),
    );
  }
}
