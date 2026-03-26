import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/header_field_widget.dart';
import 'package:flutter/material.dart';

class PaymentInfoPix extends StatefulWidget {
  final List<OrderPaidModel> modelOrderPaid;
  const PaymentInfoPix({super.key, required this.modelOrderPaid});

  @override
  State<PaymentInfoPix> createState() => _PaymentInfoPixState();
}

class _PaymentInfoPixState extends State<PaymentInfoPix> {
  late TextEditingController _txt;
  late FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _txt = TextEditingController(
      text: (widget.modelOrderPaid[1].value > 0)
          ? floatToStrF(widget.modelOrderPaid[1].value)
          : "",
    );
  }

  @override
  void didUpdateWidget(PaymentInfoPix oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_focus.hasFocus) {
      final newText = (widget.modelOrderPaid[1].value > 0)
          ? floatToStrF(widget.modelOrderPaid[1].value)
          : "";
      if (_txt.text != newText) {
        _txt.text = newText;
      }
    }
  }

  @override
  void dispose() {
    _txt.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: headerfield('Pix'),
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 35,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              focusNode: _focus,
              controller: _txt,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  _txt.text = autoDecimalPoint(value);
                }
                _txt.selection = TextSelection.fromPosition(
                    TextPosition(offset: _txt.text.length));
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  widget.modelOrderPaid[1].value = double.parse(value);
                } else {
                  widget.modelOrderPaid[1].value = 0.0;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
