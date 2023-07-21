import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:appweb/app/modules/order_production_register/order_production_register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderProductionPageMobile extends StatefulWidget {
  const OrderProductionPageMobile({super.key});

  @override
  State<OrderProductionPageMobile> createState() =>
      OrderProductionPageMobileState();
}

class OrderProductionPageMobileState extends State<OrderProductionPageMobile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderProductionRegisterModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Sistema Consignação e Venda"),
      ),
      drawer: const DrawerPageMobile(),
      body: const OrderProductionPageMobile(),
    );
  }
}
