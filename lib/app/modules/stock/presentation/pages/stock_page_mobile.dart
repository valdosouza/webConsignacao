import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_menus.dart';
import 'package:appweb/app/modules/stock/stock_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockPageMobile extends StatefulWidget {
  const StockPageMobile({super.key});

  @override
  State<StockPageMobile> createState() => _StockPageMobileState();
}

class _StockPageMobileState extends State<StockPageMobile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistema Consignação e Venda"),
      ),
      drawer: const DrawerPage(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Expanded(child: StockMenus()),
      ),
    );
  }
}
