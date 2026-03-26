import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/header_field_widget.dart';

class PaymentInfoCash extends StatefulWidget {
  final List<OrderPaidModel> modelOrderPaid;
  const PaymentInfoCash({
    super.key,
    required this.modelOrderPaid,
  });

  @override
  State<PaymentInfoCash> createState() => _PaymentInfoCashState();
}

class _PaymentInfoCashState extends State<PaymentInfoCash> {
  late TextEditingController _txt;
  late FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _txt = TextEditingController(
      text: (widget.modelOrderPaid[0].value > 0)
          ? floatToStrF(widget.modelOrderPaid[0].value)
          : "",
    );
  }

  @override
  void didUpdateWidget(PaymentInfoCash oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_focus.hasFocus) {
      final newText = (widget.modelOrderPaid[0].value > 0)
          ? floatToStrF(widget.modelOrderPaid[0].value)
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
          child: headerfield('Dinheiro'),
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
            child: TextFormField(
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
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  widget.modelOrderPaid[0].value = double.parse(value);
                } else {
                  widget.modelOrderPaid[0].value = 0.0;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
