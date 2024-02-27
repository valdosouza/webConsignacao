import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierMenuMain extends StatelessWidget {
  const CashierMenuMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Clientes Atendidos',
            () async => Modular.to.navigate(
                '/cashier/desktop/cashierstatement/desktop/salesman/salesmanlist/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Débitos de Clientes',
            () async => Modular.to.navigate(
                '/cashier/desktop/cashierstatement/desktop/customersdebit/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Resumo Mensal',
            () async => Modular.to.navigate(
                '/cashier/desktop/cashierstatementsummary/desktop/cashierstatementsummary/monthly/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Média de Venda',
            () async => Modular.to.navigate(
                '/cashier/desktop/salesaverage/desktop/salesaverage/region/'),
          ),
        ],
      ),
    );
  }
}
