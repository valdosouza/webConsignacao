import 'package:appweb/app/modules/customer/presentation/pages/customer_menus.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/financial/financial_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerPageDesktop extends StatefulWidget {
  const CustomerPageDesktop({super.key});

  @override
  State<CustomerPageDesktop> createState() => FinancialnPageDesktopState();
}

class FinancialnPageDesktopState extends State<CustomerPageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<FinancialModule>();
    });
  }

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
            DrawerPage(),
            CustomerMenus(),
            Expanded(
              flex: 1,
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
