import 'package:appweb/app/modules/costumer/presentation/pages/costumer_menus.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:flutter/material.dart';

class CostumerPageMobile extends StatefulWidget {
  const CostumerPageMobile({super.key});

  @override
  State<CostumerPageMobile> createState() => _CostumerPageMobileState();
}

class _CostumerPageMobileState extends State<CostumerPageMobile> {
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
        child: const Expanded(child: CostumerMenus()),
      ),
    );
  }
}
