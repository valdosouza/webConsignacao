import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerMenus extends StatelessWidget {
  const CustomerMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
              Icons.home,
              'Cadastro de Clientes',
              () async =>
                  Modular.to.navigate('/customer/content/customerregister/')),
        ],
      ),
    );
  }
}
