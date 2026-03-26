import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class PaymentBoleto extends StatefulWidget {
  final OrderSaleMainCardModel modelOrdersale;
  const PaymentBoleto({super.key, required this.modelOrdersale});

  @override
  State<PaymentBoleto> createState() => _PaymentBoletoState();
}

class _PaymentBoletoState extends State<PaymentBoleto> {
  late MaskedTextController _controller;
  late FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _controller = MaskedTextController(
      mask: '00/00/0000',
      text: widget.modelOrdersale.payments[0].dtExpiration,
    );
  }

  @override
  void didUpdateWidget(PaymentBoleto oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_focus.hasFocus) {
      final newText = widget.modelOrdersale.payments[0].dtExpiration;
      if (_controller.text != newText) {
        _controller.updateText(newText);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Builder(
          builder: (context) => headerfield(context, 'Vencimento', 50),
        ),
        Container(
          height: 40,
          alignment: Alignment.center,
          margin:
              const EdgeInsets.only(left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            focusNode: _focus,
            keyboardType: TextInputType.number,
            enabled: true,
            controller: _controller,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            ),
            onSubmitted: (value) {
              widget.modelOrdersale.payments[0].value =
                  widget.modelOrdersale.order.totalValue;
              if (value.isNotEmpty) {
                widget.modelOrdersale.payments[0].dtExpiration = value;
              }
            },
          ),
        ),
      ],
    );
  }
}
