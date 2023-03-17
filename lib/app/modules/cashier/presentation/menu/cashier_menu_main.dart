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
        ],
      ),
    );
  }
}
