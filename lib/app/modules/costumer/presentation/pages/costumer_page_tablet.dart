import 'package:appweb/app/modules/costumer/presentation/pages/costumer_menus.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CostumerPageTablet extends StatefulWidget {
  const CostumerPageTablet({super.key});

  @override
  State<CostumerPageTablet> createState() => _CostumerPageTabletState();
}

class _CostumerPageTabletState extends State<CostumerPageTablet> {
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
      drawer: const DrawerPage(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: const [
            CostumerMenus(),
            Expanded(
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
