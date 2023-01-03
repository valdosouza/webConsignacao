import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/pages/cashier_statement_page_desktop.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/pages/cashier_statement_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/pages/cashier_statement_page_tablet.dart';

import 'package:flutter/material.dart';

class CashierStatementPage extends StatelessWidget {
  const CashierStatementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CashierStatementPageMobile(),
      tablet: CashierStatementPageTablet(),
      desktop: CashierStatementPageDesktop(),
    );
  }
}
