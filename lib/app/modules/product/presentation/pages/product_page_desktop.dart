import 'package:appweb/app/modules/admin/admin_module.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/product/presentation/pages/product_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPageDesktop extends StatefulWidget {
  const ProductPageDesktop({super.key});

  @override
  State<ProductPageDesktop> createState() => _ProductPageDesktopState();
}

class _ProductPageDesktopState extends State<ProductPageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AdminModule>();
    });
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
            ProductMenus(),
            Expanded(
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}