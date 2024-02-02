import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritemssupplying() {
  return Container(
    alignment: Alignment.center,
    child: Row(
      children: [
        Expanded(
          flex: 190,
          child: headerfield('Bonus', 40),
        ),
        Expanded(
          flex: 380,
          child: headerfield('Descrição', 40),
        ),
        Expanded(
          flex: 190,
          child: headerfield('Sobra', 40),
        ),
        Expanded(
          flex: 240,
          child: headerfield('Devolução', 40),
        ),
        Expanded(
          flex: 315,
          child: headerfield('Nova Consignação', 40),
        ),
        Expanded(
          flex: 270,
          child: headerfield('Quantidade Consignada', 40),
        ),
      ],
    ),
  );
}
