import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinancialMenus extends StatelessWidget {
  const FinancialMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
              Icons.home,
              'Formas de Pagamento',
              () async =>
                  Modular.to.navigate('/financial/content/paymentType/')),
        ],
      ),
    );
  }
}
