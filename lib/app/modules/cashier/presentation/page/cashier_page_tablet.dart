import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier/cashier_module.dart';
import 'package:appweb/app/modules/cashier/presentation/menu/cashier_menu_mobile.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierPageTablet extends StatefulWidget {
  const CashierPageTablet({super.key});

  @override
  State<CashierPageTablet> createState() => CashierPageTabletState();
}

class CashierPageTabletState extends State<CashierPageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierModule>();
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
        title: kAppTitle,
      ),
      drawer: const DrawerPageMobile(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Expanded(child: CashierMenuMobile()),
      ),
    );
  }
}
