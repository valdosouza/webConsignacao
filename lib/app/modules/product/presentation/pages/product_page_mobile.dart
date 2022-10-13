import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/product/presentation/content/content_mobile_product.dart';
import 'package:flutter/material.dart';

class ProductPageMobile extends StatelessWidget {
  const ProductPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consignação e Venda"),
      ),
      drawer: const DrawerPage(),
      body: const ContentMobileProduct(),
    );
  }
}
