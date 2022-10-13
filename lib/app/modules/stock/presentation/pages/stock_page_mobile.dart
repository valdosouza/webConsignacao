import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/stock/presentation/content/content_mobile_stock.dart';

import 'package:flutter/material.dart';

class StockPageMobile extends StatelessWidget {
  const StockPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consignação e Venda"),
      ),
      drawer: const DrawerPage(),
      body: const ContentMobileStock(),
    );
  }
}
