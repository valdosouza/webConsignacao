import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/page/desktop.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/page/mobile.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/page/tablet.dart';
import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: Mobile(),
      tablet: Tablet(),
      desktop: Desktop(),
    );
  }
}
