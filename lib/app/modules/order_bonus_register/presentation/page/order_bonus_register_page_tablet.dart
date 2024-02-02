import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_bonus_register/order_bonus_register_module.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderBonusRegisterPageTablet extends StatefulWidget {
  const OrderBonusRegisterPageTablet({super.key});

  @override
  State<OrderBonusRegisterPageTablet> createState() =>
      _OrderBonusRegisterPageTabletState();
}

class _OrderBonusRegisterPageTabletState
    extends State<OrderBonusRegisterPageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderBonusRegisterModule>();
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
          "Ordem de Bonificação",
          style: kTitleAppBarStyle,
        ),
      ),
    );
  }
}
