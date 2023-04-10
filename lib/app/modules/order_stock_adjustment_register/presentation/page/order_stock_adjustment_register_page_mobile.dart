import 'package:appweb/app/core/shared/theme.dart';

import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Ordem de Adjuste de estoque"),
      ),
    );
  }
}
