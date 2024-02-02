import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer/customer_module.dart';
import 'package:appweb/app/modules/customer/presentation/menu/customer_menu_mobile.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerPageTablet extends StatefulWidget {
  const CustomerPageTablet({super.key});

  @override
  State<CustomerPageTablet> createState() => _CustomerPageTabletState();
}

class _CustomerPageTabletState extends State<CustomerPageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CustomerModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: kAppTitle,
      ),
      drawer: const DrawerPageMobile(),
      body: const Expanded(
        child: CustomerMenuMobile(),
      ),
    );
  }
}
