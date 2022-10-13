import 'package:appweb/app/modules/stock/presentation/pages/stock_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopStock extends StatelessWidget {
  const ContentDesktopStock({super.key});

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
              child: StockMenus(),
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
