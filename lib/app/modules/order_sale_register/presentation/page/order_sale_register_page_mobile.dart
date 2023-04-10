import 'package:appweb/app/core/shared/theme.dart';

import 'package:flutter/material.dart';

class OrderSaleRegisterPageMobile extends StatefulWidget {
  const OrderSaleRegisterPageMobile({super.key});

  @override
  State<OrderSaleRegisterPageMobile> createState() =>
      OrderSaleRegisterPageMobileState();
}

class OrderSaleRegisterPageMobileState
    extends State<OrderSaleRegisterPageMobile> {
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
