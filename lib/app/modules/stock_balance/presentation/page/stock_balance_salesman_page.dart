import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/salesman/stock_balance_salesman_page_desktop.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/salesman/stock_balance_salesman_page_mobile.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/salesman/stock_balance_salesman_page_tablet.dart';
import 'package:flutter/material.dart';

class StockBalanceSalesmanPage extends StatelessWidget {
  const StockBalanceSalesmanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: StockBalanceSalesmanPageMobile(),
      tablet: StockBalanceSalesmanPageTablet(),
      desktop: StockBalanceSalesmanPageDesktop(),
    );
  }
}
