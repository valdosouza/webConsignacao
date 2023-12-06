import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

Widget paymentBoletoHistoric(OrderSaleMainCardModel modelOrdersale) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      headerfield('Vencimento'),
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
          enabled: false,
          controller: MaskedTextController(
              mask: '00/00/0000',
              text: modelOrdersale.payments[0].dtExpiration),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
