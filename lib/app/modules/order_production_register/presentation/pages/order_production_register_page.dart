import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/order_production_register/presentation/contents/content_desktop_order_production.dart';
import 'package:appweb/app/modules/order_production_register/presentation/contents/content_mobile_order_production.dart';
import 'package:appweb/app/modules/order_production_register/presentation/contents/content_tablet_order_production.dart';
import 'package:flutter/material.dart';

class OrderProductionRegisterPage extends StatelessWidget {
  const OrderProductionRegisterPage({super.key});

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
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: const [
            DrawerPage(),
            Expanded(
              child: Responsive(
                mobile: ContentMobileOrderProduction(),
                tablet: ContentTabletOrderProduction(),
                desktop: ContentDesktopOrderProductionRegister(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
