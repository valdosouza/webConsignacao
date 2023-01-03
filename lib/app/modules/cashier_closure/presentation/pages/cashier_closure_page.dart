import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/pages/cashier_closure_page_desktop.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/pages/cashier_closure_page_mobile.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/pages/cashier_closure_page_tablet.dart';

import 'package:flutter/material.dart';

class CashierClosurePage extends StatelessWidget {
  const CashierClosurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CashierClosurePageMobile(),
      tablet: CashierClosurePageTablet(),
      desktop: CashierClosurePageDesktop(),
    );
  }
}
