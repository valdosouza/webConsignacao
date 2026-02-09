import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_main.dart';
import 'package:appweb/app/modules/financial/financial_module.dart';
import 'package:appweb/app/modules/financial/presentation/menu/financial_menu_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinancialPageTablet extends StatefulWidget {
  const FinancialPageTablet({super.key});

  @override
  State<FinancialPageTablet> createState() => _FinancialPageTabletState();
}

class _FinancialPageTabletState extends State<FinancialPageTablet> {
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
      drawer: const DrawerPageMain(),
      body: const Row(
        children: [
          FinancialMenuMain(),
          Expanded(
            child: RouterOutlet(),
          ),
        ],
      ),
    );
  }
}
