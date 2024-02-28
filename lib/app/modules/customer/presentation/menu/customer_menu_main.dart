import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerMenuMain extends StatelessWidget {
  const CustomerMenuMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Cadastro de Clientes',
            () async => Modular.to
                .navigate('/customer/desktop/customer-register/', arguments: 0),
          ),
          itemMenuDraw(
            Icons.home,
            'Orderm de Bonificação',
            () async =>
                Modular.to.navigate('/customer/desktop/orderbonus-register/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Ordenar Atendimento',
            () async =>
                Modular.to.navigate('/customer/desktop/attendance-ordering/'),
          ),
        ],
      ),
    );
  }
}
