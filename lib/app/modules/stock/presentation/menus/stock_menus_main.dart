import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockMenusMain extends StatelessWidget {
  const StockMenusMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Cadastro de Estoques',
            () async => Modular.to.navigate('/stock/desktop/stocklist/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Ajustes de Estoque',
            () async => Modular.to.navigate('/stock/desktop/stockadjustement/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Transferência de Estoques',
            () async => Modular.to.navigate('/stock/desktop/stocktransfer/'),
          ),
        ],
      ),
    );
  }
}
