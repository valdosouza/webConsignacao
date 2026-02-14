import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_main.dart';
import 'package:appweb/app/modules/financial/financial_module.dart';
import 'package:appweb/app/modules/financial/presentation/menu/financial_menu_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinancialPageDesktop extends StatefulWidget {
  const FinancialPageDesktop({super.key});

  @override
  State<FinancialPageDesktop> createState() => FinancialPageDesktopState();
}

class FinancialPageDesktopState extends State<FinancialPageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<FinancialModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: kAppTitle,
      ),
      body: const Row(
        children: [
          DrawerPageMain(),
          FinancialMenuMain(),
          Expanded(
            child: RouterOutlet(),
          ),
        ],
      ),
    );
  }
}
