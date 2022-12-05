import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class OrderStockAdjustmentRegisterPageDesktop extends StatefulWidget {
  const OrderStockAdjustmentRegisterPageDesktop({super.key});

  @override
  State<OrderStockAdjustmentRegisterPageDesktop> createState() =>
      OrderStockAdjustmentRegisterPageDesktopState();
}

class OrderStockAdjustmentRegisterPageDesktopState
    extends State<OrderStockAdjustmentRegisterPageDesktop> {
  @override
  void initState() {
    super.initState();
    /*
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockModule>();
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Ordem de Ajuste de Estoque"),
      ),
    );
  }
}
