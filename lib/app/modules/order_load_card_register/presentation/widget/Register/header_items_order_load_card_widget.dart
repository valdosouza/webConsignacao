import 'package:appweb/app/modules/order_load_card_register/presentation/widget/Register/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritemsorderLoadCard() {
  return Container(
    alignment: Alignment.center,
    child: Builder(
      builder: (context) => Row(
        children: [
          Expanded(
            flex: 4,
            child: headerfield(context, 'Descrição'),
          ),
          Expanded(
            flex: 2,
            child: headerfield(context, 'Saldo Início do dia'),
          ),
          Expanded(
            flex: 2,
            child: headerfield(context, 'Venda no dia'),
          ),
          Expanded(
            flex: 2,
            child: headerfield(context, 'Bonificação no dia'),
          ),
          Expanded(
            flex: 2,
            child: headerfield(context, 'Baixa de Produtos'),
          ),
          Expanded(
            flex: 2,
            child: headerfield(context, 'Carga próximo dia'),
          ),
          Expanded(
            flex: 2,
            child: headerfield(context, 'Saldo Atual'),
          ),
        ],
      ),
    ),
  );
}
