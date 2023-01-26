import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceSalesmanPageTablet extends StatefulWidget {
  const StockBalanceSalesmanPageTablet({super.key});

  @override
  State<StockBalanceSalesmanPageTablet> createState() =>
      _StockBalanceSalesmanPageTabletState();
}

class _StockBalanceSalesmanPageTabletState
    extends State<StockBalanceSalesmanPageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockBalanceModule>();
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
