import 'package:appweb/app/core/shared/theme.dart';

import 'package:flutter/material.dart';

class OrderStockTransferRegisterPageMobile extends StatefulWidget {
  const OrderStockTransferRegisterPageMobile({super.key});

  @override
  State<OrderStockTransferRegisterPageMobile> createState() =>
      OrderStockTransferRegisterPageMobileState();
}

class OrderStockTransferRegisterPageMobileState
    extends State<OrderStockTransferRegisterPageMobile> {
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
        title: const Text("Ordem de Transferência de estoque"),
      ),
    );
  }
}
