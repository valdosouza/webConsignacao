import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierMenusMobile extends StatelessWidget {
  const CashierMenusMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Saldo',
            () async => Modular.to.navigate('/cashier/content/cashierbalance/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Extrato',
            () async =>
                Modular.to.navigate('/cashier/content/cashierstatement/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Fechamento',
            () async => Modular.to.navigate('/cashier/content/cashierclosure/'),
          ),
        ],
      ),
    );
  }
}
