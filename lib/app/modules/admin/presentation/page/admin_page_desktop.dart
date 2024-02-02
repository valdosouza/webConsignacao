import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/admin/admin_module.dart';
import 'package:appweb/app/modules/admin/presentation/menu/admin_menu_main.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_main.dart';

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
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: kAppTitle,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Row(
          children: [
            DrawerPageMain(),
            AdminMenuMain(),
            Expanded(
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
