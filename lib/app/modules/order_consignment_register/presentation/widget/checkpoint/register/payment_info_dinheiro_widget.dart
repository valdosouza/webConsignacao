import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

class PaymentInfoDinheiro extends StatefulWidget {
  final OrderConsignmentCheckpointModel modelCheckpoint;
  const PaymentInfoDinheiro({super.key, required this.modelCheckpoint});

  @override
  State<PaymentInfoDinheiro> createState() => _PaymentInfoDinheiroState();
}

class _PaymentInfoDinheiroState extends State<PaymentInfoDinheiro> {
  late TextEditingController _txt;
  late FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _txt = TextEditingController(
      text: (widget.modelCheckpoint.payments[0].value > 0)
          ? floatToStrF(widget.modelCheckpoint.payments[0].value)
          : "",
    );
  }

  @override
  void didUpdateWidget(PaymentInfoDinheiro oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_focus.hasFocus) {
      final newText = (widget.modelCheckpoint.payments[0].value > 0)
          ? floatToStrF(widget.modelCheckpoint.payments[0].value)
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
          child: Builder(
            builder: (context) => headerfield(context, 'Dinheiro', 32),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 33,
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
                  widget.modelCheckpoint.payments[0].value =
                      double.parse(value);
                } else {
                  widget.modelCheckpoint.payments[0].value = 0.0;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
