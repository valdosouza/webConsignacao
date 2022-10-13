import 'package:appweb/app/modules/admin/admin_module.dart';
import 'package:appweb/app/modules/admin/presentation/pages/admin_menus.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminPageDesktop extends StatefulWidget {
  const AdminPageDesktop({super.key});

  @override
  State<AdminPageDesktop> createState() => _AdminPageDesktopState();
}

class _AdminPageDesktopState extends State<AdminPageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AdminModule>();
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
            AdminMenus(),
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
