import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockMenuMobile extends StatelessWidget {
  const StockMenuMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Carregamento',
            () async => Modular.to.navigate('/stockbalance/mobile/stockload/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Cliente',
            () async => Modular.to.navigate('/stockbalance/customer/all/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Vendedor',
            () async => Modular.to.navigate('/stockbalance/salesman/get/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Estoque Geral',
            () async => Modular.to.navigate('/stockbalance/general/get/'),
          ),
        ],
      ),
    );
  }
}
