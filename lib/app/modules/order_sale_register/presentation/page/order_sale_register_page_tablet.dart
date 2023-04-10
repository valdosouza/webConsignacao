import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderSaleRegisterPageTablet extends StatefulWidget {
  const OrderSaleRegisterPageTablet({super.key});

  @override
  State<OrderSaleRegisterPageTablet> createState() =>
      _OrderSaleRegisterPageTabletState();
}

class _OrderSaleRegisterPageTabletState
    extends State<OrderSaleRegisterPageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderSaleRegisterModule>();
    });
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
