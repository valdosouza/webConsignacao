import 'package:appweb/app/modules/product/presentation/pages/product_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopProduct extends StatelessWidget {
  const ContentDesktopProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: const [
            Expanded(
              flex: 1,
              child: ProductMenus(),
            ),
            Expanded(
              flex: 5,
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
