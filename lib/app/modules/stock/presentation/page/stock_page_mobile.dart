import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:appweb/app/modules/stock/presentation/menu/stock_menu_mobile.dart';
import 'package:appweb/app/modules/stock/stock_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StocPageMobile extends StatefulWidget {
  const StocPageMobile({super.key});

  @override
  State<StocPageMobile> createState() => _StocPageMobileState();
}

class _StocPageMobileState extends State<StocPageMobile> {
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
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: kAppTitle,
      ),
      drawer: const DrawerPageMobile(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const StockMenuMobile(),
      ),
    );
  }
}
