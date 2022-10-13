import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/stock/presentation/content/content_tablet_stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockPageTablet extends StatelessWidget {
  const StockPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consginação e Venda"),
      ),
      drawer: const DrawerPage(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: const [
            Expanded(
              flex: 1,
              child: RouterOutlet(),
            ),
            Expanded(
              flex: 2,
              child: ContentTabletStock(),
            ),
          ],
        ),
      ),
    );
  }
}
