import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/admin/admin_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierBalancePageDesktop extends StatefulWidget {
  const CashierBalancePageDesktop({super.key});

  @override
  State<CashierBalancePageDesktop> createState() => _CashierBalancePageDesktopState();
}

class _CashierBalancePageDesktopState extends State<CashierBalancePageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AdminModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Sistema Consignação e Venda"),
      ),
      body:Text("Sistema Consignação e Venda"),
    );
  }
}
