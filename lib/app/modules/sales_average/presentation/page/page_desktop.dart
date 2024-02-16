import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/sales_average/sales_average_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageDesktop extends StatefulWidget {
  const PageDesktop({super.key});

  @override
  State<PageDesktop> createState() => PageDesktopState();
}

class PageDesktopState extends State<PageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<SalesAverageModule>();
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
        child: const Text("Desktop"),
      ),
    );
  }
}
