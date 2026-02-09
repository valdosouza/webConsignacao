import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritemssupplying() {
  return Container(
    alignment: Alignment.center,
    child: Builder(
      builder: (context) => Row(
        children: [
          Expanded(
            flex: 190,
            child: headerfield(context, 'Bonus', 50),
          ),
          Expanded(
            flex: 380,
            child: headerfield(context, 'Descrição', 50),
          ),
          Expanded(
            flex: 190,
            child: headerfield(context, 'Sobra', 50),
          ),
          Expanded(
            flex: 240,
            child: headerfield(context, 'Devolução', 50),
          ),
          Expanded(
            flex: 315,
            child: headerfield(context, 'Nova Consignação', 50),
          ),
          Expanded(
            flex: 270,
            child: headerfield(context, 'Quantidade Consignada', 50),
          ),
        ],
      ),
    ),
  );
}
