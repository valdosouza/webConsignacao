import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockAdjustmentRegisterPageMobile extends StatefulWidget {
  const OrderStockAdjustmentRegisterPageMobile({super.key});

  @override
  State<OrderStockAdjustmentRegisterPageMobile> createState() =>
      OrderStockAdjustmentRegisterPageMobileState();
}

class OrderStockAdjustmentRegisterPageMobileState
    extends State<OrderStockAdjustmentRegisterPageMobile> {
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
        title: const AutoSizeText(
          "Ordem de ajuste de estoque",
          style: kTitleAppBarStyle,
        ),
      ),
    );
  }
}
