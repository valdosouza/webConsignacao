import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:appweb/app/modules/product/presentation/content/content_mobile_product.dart';
import 'package:flutter/material.dart';

class ProductPageMobile extends StatefulWidget {
  const ProductPageMobile({super.key});

  @override
  State<ProductPageMobile> createState() => _ProductMobiletState();
}

class _ProductMobiletState extends State<ProductPageMobile> {
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
      drawer: const DrawerPageMobile(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const ContentMobileProduct(),
      ),
    );
  }
}
