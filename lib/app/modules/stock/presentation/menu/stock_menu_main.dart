import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockMenuMain extends StatelessWidget {
  const StockMenuMain({super.key});

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
          itemMenuDraw(
            Icons.home,
            'Carregamento',
            () async => Modular.to.navigate('/stock/desktop/orderloadCard/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Saldo por Estoque',
            () async =>
                Modular.to.navigate('/stock/desktop/stockbalance/bystocklist/'),
          ),
        ],
      ),
    );
  }
}
