import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderProductionMenusMain extends StatelessWidget {
  const OrderProductionMenusMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Ordem de Produção',
            () async => Modular.to.navigate('/orderproduction/content/order/'),
          ),
        ],
      ),
    );
  }
}
