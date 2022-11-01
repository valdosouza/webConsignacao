import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminMenus extends StatelessWidget {
  const AdminMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(Icons.home, 'Estabelecimento',
              () async => Modular.to.navigate('/admin/content/institution/')),
          itemMenuDraw(Icons.home, 'Cadastro de Usuários',
              () async => Modular.to.navigate('/admin/content/user/')),
          itemMenuDraw(Icons.home, 'Cadastro de Rotas',
              () async => Modular.to.navigate('/admin/content/routes/')),
        ],
      ),
    );
  }
}
