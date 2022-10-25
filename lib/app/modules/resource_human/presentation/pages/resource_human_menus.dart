import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResourceHumanMenus extends StatelessWidget {
  const ResourceHumanMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
              Icons.home,
              'Cargos',
              () async =>
                  Modular.to.navigate('/resourcehuman/content/lineBusiness/')),
        ],
      ),
    );
  }
}
