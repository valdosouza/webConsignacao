import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier/presentation/menus/cashier_menus_mobile.dart';
import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierClosurePageTablet extends StatefulWidget {
  const CashierClosurePageTablet({super.key});

  @override
  State<CashierClosurePageTablet> createState() =>
      CashierClosurePageTabletState();
}

class CashierClosurePageTabletState extends State<CashierClosurePageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierClosureModule>();
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
      drawer: const DrawerPageMobile(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Expanded(child: CashierMenusMobile()),
      ),
    );
  }
}
