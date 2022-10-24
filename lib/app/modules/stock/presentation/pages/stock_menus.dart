import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockMenus extends StatelessWidget {
  const StockMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(Icons.home, 'Cadastro de Estoques',
              () async => Modular.to.navigate('/stock/content/stocklist/')),
          itemMenuDraw(
              Icons.home,
              'Movimentação de Estoque',
              () async =>
                  Modular.to.navigate('/stock/content/stockstatement/')),
        ],
      ),
    );
  }
}
