import 'package:appweb/app/modules/admin/presentation/content/content_mobile_admin.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:flutter/material.dart';

class AdminPageMobile extends StatelessWidget {
  const AdminPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consignação e Venda"),
      ),
      drawer: const DrawerPage(),
      body: const ContentMobileAdmin(),
    );
  }
}
