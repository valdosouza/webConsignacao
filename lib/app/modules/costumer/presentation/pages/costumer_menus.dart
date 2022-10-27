import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CostumerMenus extends StatelessWidget {
  const CostumerMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
              Icons.home,
              'Clientes',
              () async =>
                  Modular.to.navigate('/costumer/content/customer-register/')),
        ],
      ),
    );
  }
}
