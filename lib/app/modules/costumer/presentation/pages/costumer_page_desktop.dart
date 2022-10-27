import 'package:appweb/app/modules/costumer/presentation/pages/costumer_menus.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CostumerPageDesktop extends StatefulWidget {
  const CostumerPageDesktop({super.key});

  @override
  State<CostumerPageDesktop> createState() => _CostumerPageDesktopState();
}

class _CostumerPageDesktopState extends State<CostumerPageDesktop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistema Consignação e Venda"),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: const [
            DrawerPage(),
            CostumerMenus(),
            Expanded(
              flex: 1,
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
