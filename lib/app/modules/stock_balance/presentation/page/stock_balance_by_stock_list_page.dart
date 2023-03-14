import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/by_stock_list/stock_balance_by_stock_list_page_desktop.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/by_stock_list/stock_balance_by_stock_list_page_mobile.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/by_stock_list/stock_balance_by_stock_list_page_tablet.dart';
import 'package:flutter/material.dart';

class StockBalanceByStockListPage extends StatelessWidget {
  const StockBalanceByStockListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: StockBalanceByStockListPageMobile(),
      tablet: StockBalanceByStockListPageTablet(),
      desktop: StockBalanceByStockListPageDesktop(),
    );
  }
}
