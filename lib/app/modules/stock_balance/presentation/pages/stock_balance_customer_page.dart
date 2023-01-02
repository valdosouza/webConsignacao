import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/stock_balance/presentation/pages/customer/stock_balance_customer_page_desktop.dart';
import 'package:appweb/app/modules/stock_balance/presentation/pages/customer/stock_balance_customer_page_mobile.dart';
import 'package:appweb/app/modules/stock_balance/presentation/pages/customer/stock_balance_customer_page_tablet.dart';
import 'package:flutter/material.dart';

class StockBalanceCustomerPage extends StatelessWidget {
  const StockBalanceCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: StockBalanceCustomerPageMobile(),
      tablet: StockBalanceCustomerPageTablet(),
      desktop: StockBalanceCustomerPageDesktop(),
    );
  }
}
