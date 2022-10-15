import 'package:appweb/app/modules/stock_list_register/presentation/content/desktop/stock_list_list.dart';

import 'package:flutter/material.dart';

class StockListMain extends StatefulWidget {
  const StockListMain({super.key});

  @override
  State<StockListMain> createState() => _StockListMainState();
}

class _StockListMainState extends State<StockListMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Estoques"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: const StockListList(),
    );
  }
}
