import 'package:appweb/app/modules/order_load_card_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget headeritemsorderLoadCard() {
  return Container(
    alignment: Alignment.center,
    child: Row(
      children: [
        Expanded(
          flex: 500,
          child: headerfield('Descrição'),
        ),
        Expanded(
          flex: 250,
          child: headerfield('Saldo Início do dia'),
        ),
        Expanded(
          flex: 250,
          child: headerfield('Venda no dia'),
        ),
        Expanded(
          flex: 250,
          child: headerfield('Bonificação no dia'),
        ),
        Expanded(
          flex: 250,
          child: headerfield('Baixa de Produtos'),
        ),
        Expanded(
          flex: 250,
          child: headerfield('Carga próximo dia'),
        ),
        Expanded(
          flex: 250,
          child: headerfield('Saldo Atual'),
        ),
      ],
    ),
  );
}
