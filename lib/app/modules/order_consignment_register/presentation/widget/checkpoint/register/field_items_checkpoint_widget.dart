import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:flutter/material.dart';

class FieldItemCheckpoint extends StatefulWidget {
  final OrderConsignmentCheckpointCardModel item;
  final int position;
  final bool enabled;
  final int decimal;
  final TextAlign textAlign;
  final FocusNode focus;

  const FieldItemCheckpoint({
    super.key,
    required this.item,
    required this.position,
    required this.enabled,
    required this.decimal,
    required this.textAlign,
    required this.focus,
  });

  @override
  State<FieldItemCheckpoint> createState() => _FieldItemCheckpointState();
}

class _FieldItemCheckpointState extends State<FieldItemCheckpoint> {
  late TextEditingController _controller;

  String _textForItem(OrderConsignmentCheckpointCardModel item, int position) {
    switch (position) {
      case 1:
        return item.bonus.toStringAsFixed(0);
      case 2:
        return item.nameProduct;
      case 3:
        return item.qttyConsigned.toStringAsFixed(0);
      case 4:
        if (item.leftover == item.qttyConsigned) {
          return item.leftover.toStringAsFixed(0);
        }
        return (item.sale > 0) ? item.leftover.toStringAsFixed(0) : "";
      case 5:
        return (item.sale > 0) ? item.sale.toStringAsFixed(0) : "";
      case 6:
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
  void didUpdateWidget(FieldItemCheckpoint oldWidget) {
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
              widget.item.qttyConsigned = double.parse(value);
              break;
            case 4:
              if (value.isNotEmpty) {
                widget.item.leftover = double.parse(value);
                widget.item.sale =
                    (widget.item.qttyConsigned - widget.item.leftover);
                if (widget.item.unitValue == 0) widget.item.unitValue = 1;
                widget.item.subtotal = double.parse(
                    ((widget.item.qttyConsigned - widget.item.leftover) *
                            widget.item.unitValue)
                        .toStringAsFixed(2));
              } else {
                widget.item.leftover = 0;
                widget.item.sale = 0;
                widget.item.subtotal = 0;
              }
              break;
          }
        },
        controller: _controller,
      ),
    );
  }
}
