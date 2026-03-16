import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritemssupplying({double headerHeight = 50}) {
  return Container(
    alignment: Alignment.center,
    child: Builder(
      builder: (context) => Row(
        children: [
          Expanded(
            flex: 190,
            child: headerfield(context, 'Bonus', headerHeight),
          ),
          Expanded(
            flex: 380,
            child: headerfield(context, 'Descrição', headerHeight),
          ),
          Expanded(
            flex: 190,
            child: headerfield(context, 'Sobra', headerHeight),
          ),
          Expanded(
            flex: 240,
            child: headerfield(context, 'Devolução', headerHeight),
          ),
          Expanded(
            flex: 315,
            child: headerfield(context, 'Nova Consignação', headerHeight),
          ),
          Expanded(
            flex: 270,
            child: headerfield(context, 'Quantidade Consignada', headerHeight),
          ),
        ],
      ),
    ),
  );
}
