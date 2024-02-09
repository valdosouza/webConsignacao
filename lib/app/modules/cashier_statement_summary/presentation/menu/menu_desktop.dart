import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuDesktop extends StatelessWidget {
  const MenuDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Este submenu não existe para Desktop',
            () async => Modular.to.navigate('/cashier/content/cashierbalance/'),
          ),
        ],
      ),
    );
  }
}
