import 'package:appweb/app/core/shared/theme.dart';

import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:appweb/app/modules/home/presentation/content/content_mobile_home.dart';
import 'package:flutter/material.dart';

class HomePageTablet extends StatelessWidget {
  const HomePageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Consginação e Venda"),
      ),
      drawer: const DrawerPageMobile(),
      body: const ContentMobileHome(),
    );
  }
}
