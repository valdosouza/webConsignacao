import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerMenusMobile extends StatelessWidget {
  const CustomerMenusMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Por rota',
            () async => Modular.to.navigate('/attendancesalesroute/content/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Por vendedor',
            () async => Modular.to.navigate('/attendancesalesman/content/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Novo',
            () async =>
                Modular.to.navigate('/customer/mobile/customer-register/'),
          ),
        ],
      ),
    );
  }
}
