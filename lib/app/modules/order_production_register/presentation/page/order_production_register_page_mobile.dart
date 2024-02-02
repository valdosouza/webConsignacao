import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_production_register/order_production_register_module.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderProductionRegisterPageMobile extends StatefulWidget {
  const OrderProductionRegisterPageMobile({super.key});

  @override
  State<OrderProductionRegisterPageMobile> createState() =>
      OrderProductionRegisterPageMobileState();
}

class OrderProductionRegisterPageMobileState
    extends State<OrderProductionRegisterPageMobile> {
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
        title: const AutoSizeText(
          "Ordem de Produção",
          style: kTitleAppBarStyle,
        ),
      ),
    );
  }
}
