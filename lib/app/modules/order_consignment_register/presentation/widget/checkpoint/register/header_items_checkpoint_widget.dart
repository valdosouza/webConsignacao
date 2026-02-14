import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritemscheckpoint() {
  return Container(
    alignment: Alignment.center,
    child: Builder(
      builder: (context) => Row(
        children: [
          Expanded(
            flex: 200,
            child: headerfield(context, 'Bonus', 50),
          ),
          Expanded(
            flex: 400,
            child: headerfield(context, 'Descrição', 50),
          ),
          Expanded(
            flex: 270,
            child: headerfield(context, 'Quantidade Consignada', 50),
          ),
          Expanded(
            flex: 200,
            child: headerfield(context, 'Sobra', 50),
          ),
          Expanded(
            flex: 315,
            child: headerfield(context, 'Quantidade Vendida', 50),
          ),
          Expanded(
            flex: 300,
            child: headerfield(context, 'Valor por Produto', 50),
          ),
        ],
      ),
    ),
  );
}
