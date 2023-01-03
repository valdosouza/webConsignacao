import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierClosureMenusMobile extends StatelessWidget {
  const CashierClosureMenusMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Hoje',
            () async => Modular.to.navigate('/cashierclosure/mobile/today/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Ontem',
            () async =>
                Modular.to.navigate('/cashierclosure/mobile/yesterday/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Anteriores',
            () async =>
                Modular.to.navigate('/cashierclosure/mobile/allpreviously/'),
          ),
        ],
      ),
    );
  }
}
