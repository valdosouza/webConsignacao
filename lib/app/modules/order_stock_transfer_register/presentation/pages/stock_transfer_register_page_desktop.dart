import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class OrderStockTransferRegisterPageDesktop extends StatefulWidget {
  const OrderStockTransferRegisterPageDesktop({super.key});

  @override
  State<OrderStockTransferRegisterPageDesktop> createState() =>
      OrderStockTransferRegisterPageDesktopState();
}

class OrderStockTransferRegisterPageDesktopState
    extends State<OrderStockTransferRegisterPageDesktop> {
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
        title: const Text("Ordem de Transferência de Estoque"),
      ),
    );
  }
}
