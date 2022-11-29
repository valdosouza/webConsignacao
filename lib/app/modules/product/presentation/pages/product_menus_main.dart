import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductMenusMain extends StatelessWidget {
  const ProductMenusMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(Icons.home, 'Cadastro de Produtos',
              () async => Modular.to.navigate('/product/content/listproduct/')),
          itemMenuDraw(
              Icons.home,
              'Tabela de Preço',
              () async =>
                  Modular.to.navigate('/product/content/listpricetable/')),
        ],
      ),
    );
  }
}
