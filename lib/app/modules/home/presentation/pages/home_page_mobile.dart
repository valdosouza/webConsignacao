import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page.dart';
import 'package:appweb/app/modules/home/presentation/content/content_mobile_home.dart';
import 'package:flutter/material.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Consignação e Venda"),
      ),
      drawer: const DrawerPage(),
      body: const ContentMobileHome(),
    );
  }
}
