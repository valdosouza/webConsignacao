import 'package:appweb/app/modules/stock/presentation/content/content_stock.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_page.dart';
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
        ChildRoute('/content/stocklist/',
            child: (_, args) => Scaffold(
                  appBar: AppBar(
                    title: const Text("Lista de Estoques"),
                  ),
                  body: const Center(
                    child: Text("Lista de Estoque"),
                  ),
                )),
        ChildRoute('/content/stockstatement/',
            child: (_, args) => const Center(
                  child: Text("Movimentação de Estoque"),
                )),
      ],
    ),
  ];
}
