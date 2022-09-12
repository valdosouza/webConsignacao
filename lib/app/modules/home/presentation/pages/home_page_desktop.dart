import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/home/presentation/component/items_menus.dart';
import 'package:appweb/app/modules/home/presentation/content/content_desktop.dart';
import 'package:flutter/material.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

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
            Expanded(
              flex: 1,
              child: DrawerPage(),
            ),
            Expanded(
              flex: 1,
              child: ItemsMenus(),
            ),
            Expanded(
              flex: 2,
              child: ContentDesktop(),
            ),
          ],
        ),
      ),
    );
  }
}
