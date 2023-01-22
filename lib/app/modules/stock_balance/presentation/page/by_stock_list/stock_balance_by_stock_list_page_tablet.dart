import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/stock/stock_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceByStockListPageTablet extends StatefulWidget {
  const StockBalanceByStockListPageTablet({super.key});

  @override
  State<StockBalanceByStockListPageTablet> createState() =>
      _StockBalanceByStockListPageTabletState();
}

class _StockBalanceByStockListPageTabletState
    extends State<StockBalanceByStockListPageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Balanço de estoque geral"),
      ),
    );
  }
}
