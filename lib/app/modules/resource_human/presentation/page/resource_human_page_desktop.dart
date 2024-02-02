import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_main.dart';
import 'package:appweb/app/modules/resource_human/presentation/menu/resource_human_menu_main.dart';
import 'package:appweb/app/modules/resource_human/resource_human_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResourceHumanPageDesktop extends StatefulWidget {
  const ResourceHumanPageDesktop({super.key});

  @override
  State<ResourceHumanPageDesktop> createState() => FinancialnPageDesktopState();
}

class FinancialnPageDesktopState extends State<ResourceHumanPageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<ResourceHumanModule>();
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
            ResourceHumanMenuMain(),
            Expanded(
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
