import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockAdjustmentRegisterPageTablet extends StatefulWidget {
  const OrderStockAdjustmentRegisterPageTablet({super.key});

  @override
  State<OrderStockAdjustmentRegisterPageTablet> createState() =>
      _OrderStockAdjustmentRegisterPageTabletState();
}

class _OrderStockAdjustmentRegisterPageTabletState
    extends State<OrderStockAdjustmentRegisterPageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderStockAdjustmentRegisterModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Ordem de Ajuste de estoque"),
      ),
    );
  }
}
