import 'package:appweb/app/modules/cashier/presentation/pages/cashier_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/content/',
      child: (_, args) => const CashierPage(),
      children: [
        ChildRoute('/cashierstatement/',
            child: (_, args) => const Center(
                  child: Text("Movimentação de Caixa"),
                )),
      ],
    ),
  ];
}
