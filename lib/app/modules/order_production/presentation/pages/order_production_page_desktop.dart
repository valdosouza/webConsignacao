import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_main.dart';
import 'package:appweb/app/modules/order_production/presentation/menus/order_production_menus_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderProductionPageDesktop extends StatefulWidget {
  const OrderProductionPageDesktop({super.key});

  @override
  State<OrderProductionPageDesktop> createState() =>
      OrderProductionPageDesktopState();
}

class OrderProductionPageDesktopState
    extends State<OrderProductionPageDesktop> {
  @override
  void initState() {
    super.initState();
    /*
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockModule>();
    });
    */
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
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: const [
            DrawerPageMain(),
            OrderProductionMenusMain(),
            Expanded(
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
