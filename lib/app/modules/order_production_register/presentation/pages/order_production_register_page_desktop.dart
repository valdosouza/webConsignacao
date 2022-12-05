import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class OrderProductionRegisterPageDesktop extends StatefulWidget {
  const OrderProductionRegisterPageDesktop({super.key});

  @override
  State<OrderProductionRegisterPageDesktop> createState() =>
      OrderProductionRegisterPageDesktopState();
}

class OrderProductionRegisterPageDesktopState
    extends State<OrderProductionRegisterPageDesktop> {
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
        title: const Text("Ordem de Produção"),
      ),
    );
  }
}
