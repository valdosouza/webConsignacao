import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductMenus extends StatelessWidget {
  const ProductMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(Icons.home, 'Cadastro de Produtos',
              () async => Modular.to.popAndPushNamed('/product/listproduct/')),
          itemMenuDraw(
              Icons.home,
              'Tabela de Preço',
              () async =>
                  Modular.to.popAndPushNamed('/product/listpricetable/')),
        ],
      ),
    );
  }
}
