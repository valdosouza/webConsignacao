import 'package:flutter/material.dart';

import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/ordersale/header_field_widget.dart';

class PaymentInfoCash extends StatefulWidget {
  final List<OrderPaidModel> modelOrderPaid;
  const PaymentInfoCash({
    Key? key,
    required this.modelOrderPaid,
  }) : super(key: key);

  @override
  State<PaymentInfoCash> createState() => _PaymentInfoCashState();
}

class _PaymentInfoCashState extends State<PaymentInfoCash> {
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
              controller: TextEditingController(
                  text: (widget.modelOrderPaid[0].value > 0)
                      ? widget.modelOrderPaid[0].value.toStringAsFixed(2)
                      : ""),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
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
