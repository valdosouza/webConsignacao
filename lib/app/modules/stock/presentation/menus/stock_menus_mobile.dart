import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockMenusMobile extends StatelessWidget {
  const StockMenusMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Carregamento',
            () async => Modular.to.navigate('/stock/content/stockload/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Cliente',
            () async => Modular.to.navigate('/stockcustomer/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Vendedor',
            () async => Modular.to.navigate('/stocksalesman/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Estoque Geral',
            () async => Modular.to.navigate('/stockgeneral/'),
          ),
        ],
      ),
    );
  }
}
