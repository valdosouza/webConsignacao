import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/pages/stock_balance_general_page_desktop.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/pages/stock_balance_general_page_mobile.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/pages/stock_balance_general_page_tablet.dart';
import 'package:flutter/material.dart';

class StockBalanceGeneralPage extends StatelessWidget {
  const StockBalanceGeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: StockBalanceGeneralPageMobile(),
      tablet: StockBalanceGeneralPageTablet(),
      desktop: StockBalanceGeneralPageDesktop(),
    );
  }
}
