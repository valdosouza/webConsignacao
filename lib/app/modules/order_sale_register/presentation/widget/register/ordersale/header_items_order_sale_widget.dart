import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritemsordersale() {
  return Container(
    alignment: Alignment.center,
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: headerfield('Bonus'),
        ),
        Expanded(
          flex: 4,
          child: headerfield('Descrição'),
        ),
        Expanded(
          flex: 3,
          child: headerfield('Venda'),
        ),
        Expanded(
          flex: 3,
          child: headerfield('Valor por Produto'),
        ),
      ],
    ),
  );
}
