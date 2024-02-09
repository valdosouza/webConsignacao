import 'package:flutter/material.dart';

import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/header_field_widget.dart';

class PaymentInfoCashHistoric extends StatefulWidget {
  final List<OrderPaidModel> modelOrderPaid;
  const PaymentInfoCashHistoric({
    super.key,
    required this.modelOrderPaid,
  });

  @override
  State<PaymentInfoCashHistoric> createState() =>
      _PaymentInfoCashHistoricState();
}

class _PaymentInfoCashHistoricState extends State<PaymentInfoCashHistoric> {
  @override
  Widget build(BuildContext context) {
    var txt = TextEditingController(
        text: (widget.modelOrderPaid[0].value > 0)
            ? widget.modelOrderPaid[0].value.toStringAsFixed(2)
            : "");
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
              controller: txt,
              enabled: false,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
