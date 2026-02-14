import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

Widget paymentBoleto(OrderSaleMainCardModel modelOrdersale) {
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
          keyboardType: TextInputType.number,
          enabled: true,
          controller: MaskedTextController(
              mask: '00/00/0000',
              text: modelOrdersale.payments[0].dtExpiration),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          ),
          onSubmitted: (value) {
            modelOrdersale.payments[0].value = modelOrdersale.order.totalValue;
            if (value.isNotEmpty) {
              modelOrdersale.payments[0].dtExpiration = value;
            }
          },
        ),
      ),
    ],
  );
}
