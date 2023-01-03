import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementMenusMobile extends StatelessWidget {
  const CashierStatementMenusMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Do Dia',
            () async => Modular.to.navigate('/cashierstatement/mobile/byday/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Do Mês',
            () async =>
                Modular.to.navigate('/cashierstatement/mobile/bymonth/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Clientes Cobrados',
            () async => Modular.to
                .navigate('/cashierstatement/mobile/customercharged/'),
          ),
        ],
      ),
    );
  }
}
