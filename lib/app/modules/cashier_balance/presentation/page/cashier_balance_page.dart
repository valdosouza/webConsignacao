import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/page/cashier_balance_page_desktop.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/page/cashier_balance_page_mobile.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/page/cashier_balance_page_tablet.dart';

import 'package:flutter/material.dart';

class CashierBalancePage extends StatelessWidget {
  const CashierBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CashierBalancePageMobile(),
      tablet: CashierBalancePageTablet(),
      desktop: CashierBalancePageDesktop(),
    );
  }
}
