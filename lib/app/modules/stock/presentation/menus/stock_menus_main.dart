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
            () async => Modular.to.navigate('/stock/content/stocklist/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Ajustes de Estoque',
            () async => Modular.to.navigate('/stock/content/stockadjustement/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Transferência de Estoques',
            () async => Modular.to.navigate('/stock/content/stocktransfer/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Estoque de Clientes',
            () async => Modular.to.navigate('/stock/content/stockcustomer/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Estoque de Vendedores',
            () async => Modular.to.navigate('/stock/content/stocksalesman/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Estoque de Principal',
            () async => Modular.to.navigate('/stock/content/stockmain/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Estoque Geral',
            () async => Modular.to.navigate('/stock/content/stockgeneral/'),
          ),
        ],
      ),
    );
  }
}
