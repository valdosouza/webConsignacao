import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer/customer_module.dart';
import 'package:appweb/app/modules/customer/presentation/menu/customer_menu_main.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerPageDesktop extends StatefulWidget {
  const CustomerPageDesktop({super.key});

  @override
  State<CustomerPageDesktop> createState() => CustomerPageDesktopState();
}

class CustomerPageDesktopState extends State<CustomerPageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CustomerModule>();
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
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Row(
          children: [
            DrawerPageMain(),
            CustomerMenuMain(),
            Expanded(
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
