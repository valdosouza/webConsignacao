import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/financial/presentation/pages/financial_page_desktop.dart';
import 'package:appweb/app/modules/financial/presentation/pages/financial_page_mobile.dart';
import 'package:appweb/app/modules/financial/presentation/pages/financial_page_tablet.dart';

import 'package:flutter/material.dart';

class FinancialPage extends StatelessWidget {
  const FinancialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: FinancialPageMobile(),
      tablet: FinancialPageTablet(),
      desktop: FinancialPageDesktop(),
    );
  }
}
