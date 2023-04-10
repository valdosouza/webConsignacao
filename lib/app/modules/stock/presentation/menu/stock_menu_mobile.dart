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
            'Reabaster Estoque',
            () async =>
                Modular.to.navigate('/stock/mobile/reload/stocktransfer/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Saldo de Estoque',
            () async =>
                Modular.to.navigate('/stock/mobile/balance/bysalesman/get/'),
          ),
        ],
      ),
    );
  }
}
