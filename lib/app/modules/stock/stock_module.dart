import 'package:appweb/app/modules/stock/presentation/content/content_stock.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_page.dart';
import 'package:appweb/app/modules/stock_list_register/stock_list_register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const StockPage(),
      children: [
        ChildRoute('/content/', child: (_, args) => const ContentStock()),
        ModuleRoute('/content/stocklist/', module: StockListRegisterModule()),
        ChildRoute('/content/stockstatement/',
            child: (_, args) => const Center(
                  child: Text("Movimentação de Estoque"),
                )),
      ],
    ),
  ];
}
