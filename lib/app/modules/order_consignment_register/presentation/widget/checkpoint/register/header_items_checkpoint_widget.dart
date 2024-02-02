import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritemscheckpoint() {
  return Container(
    alignment: Alignment.center,
    child: Row(
      children: [
        Expanded(
          flex: 200,
          child: headerfield('Bonus', 40),
        ),
        Expanded(
          flex: 400,
          child: headerfield('Descrição', 40),
        ),
        Expanded(
          flex: 270,
          child: headerfield('Quantidade Consignada', 40),
        ),
        Expanded(
          flex: 200,
          child: headerfield('Sobra', 40),
        ),
        Expanded(
          flex: 315,
          child: headerfield('Quantidade Vendida', 40),
        ),
        Expanded(
          flex: 300,
          child: headerfield('Valor por Produto', 40),
        ),
      ],
    ),
  );
}
