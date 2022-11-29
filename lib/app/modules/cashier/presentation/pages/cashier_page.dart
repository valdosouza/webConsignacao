import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/cashier/presentation/pages/cashier_page_desktop.dart';
import 'package:appweb/app/modules/cashier/presentation/pages/cashier_page_mobile.dart';
import 'package:appweb/app/modules/cashier/presentation/pages/cashier_page_tablet.dart';

import 'package:flutter/material.dart';

class CashierPage extends StatelessWidget {
  const CashierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CashierPageMobile(),
      tablet: CashierPageTablet(),
      desktop: CashierPageDesktop(),
    );
  }
}
