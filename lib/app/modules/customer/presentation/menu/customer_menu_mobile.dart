import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerMenuMobile extends StatelessWidget {
  const CustomerMenuMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Por rota',
            () async => Modular.to.navigate('/attendancesalesroute/mobile/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Lista',
            () async => Modular.to.navigate('/attendancecustomer/mobile/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Novo',
            () async => Modular.to
                .navigate('/customer/mobile/register/customer-register/'),
          ),
        ],
      ),
    );
  }
}
