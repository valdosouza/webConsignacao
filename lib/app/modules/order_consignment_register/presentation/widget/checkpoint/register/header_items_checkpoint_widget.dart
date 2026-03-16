import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritemscheckpoint({double headerHeight = 50}) {
  return Container(
    alignment: Alignment.center,
    child: Builder(
      builder: (context) => Row(
        children: [
          Expanded(
            flex: 200,
            child: headerfield(context, 'Bonus', headerHeight),
          ),
          Expanded(
            flex: 400,
            child: headerfield(context, 'Descrição', headerHeight),
          ),
          Expanded(
            flex: 270,
            child: headerfield(context, 'Quantidade Consignada', headerHeight),
          ),
          Expanded(
            flex: 200,
            child: headerfield(context, 'Sobra', headerHeight),
          ),
          Expanded(
            flex: 315,
            child: headerfield(context, 'Quantidade Vendida', headerHeight),
          ),
          Expanded(
            flex: 300,
            child: headerfield(context, 'Valor por Produto', headerHeight),
          ),
        ],
      ),
    ),
  );
}
