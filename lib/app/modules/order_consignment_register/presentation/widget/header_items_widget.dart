import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritems() {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 1.0, top: 0.0, right: 1.0, bottom: 0.0),
    child: Row(
      children: [
        Expanded(
          flex: 200,
          child: headerfield('Bonus'),
        ),
        Expanded(
          flex: 400,
          child: headerfield('Descrição'),
        ),
        Expanded(
          flex: 270,
          child: headerfield('Quantidade Consignada'),
        ),
        Expanded(
          flex: 200,
          child: headerfield('Sobra'),
        ),
        Expanded(
          flex: 315,
          child: headerfield('Quantidade Vendida'),
        ),
        Expanded(
          flex: 300,
          child: headerfield('Valor por Produto'),
        ),
      ],
    ),
  );
}
