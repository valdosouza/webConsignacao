import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/product/presentation/pages/product_menus.dart';
import 'package:appweb/app/modules/product/product_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPAgeMobile extends StatefulWidget {
  const ProductPAgeMobile({super.key});

  @override
  State<ProductPAgeMobile> createState() => _ProductMobiletState();
}

class _ProductMobiletState extends State<ProductPAgeMobile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<ProductModule>();
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
        title: const Text("Sistema Consignação e Venda"),
      ),
      drawer: const DrawerPage(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Expanded(
          child: ProductMenus(),
        ),
      ),
    );
  }
}
