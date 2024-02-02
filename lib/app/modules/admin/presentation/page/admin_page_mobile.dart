import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/admin/admin_module.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminPageMobile extends StatefulWidget {
  const AdminPageMobile({super.key});

  @override
  State<AdminPageMobile> createState() => _AdminPageMobileState();
}

class _AdminPageMobileState extends State<AdminPageMobile> {
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
      drawer: const DrawerPageMobile(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Text("Disponivel apenas para Desktop"),
      ),
    );
  }
}
