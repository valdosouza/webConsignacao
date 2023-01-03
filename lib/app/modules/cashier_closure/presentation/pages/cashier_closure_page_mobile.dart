import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/menus/cashier_closure_menus_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierClosurePageMobile extends StatefulWidget {
  const CashierClosurePageMobile({super.key});

  @override
  State<CashierClosurePageMobile> createState() =>
      CashierClosurePageMobileState();
}

class CashierClosurePageMobileState extends State<CashierClosurePageMobile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
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
        title: const Text("Extrato"),
      ),
      drawer: const DrawerPageMobile(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const CashierClosureMenusMobile(),
      ),
    );
  }
}
