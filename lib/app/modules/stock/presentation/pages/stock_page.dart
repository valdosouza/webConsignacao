import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_page_desktop.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_page_mobile.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_page_tablet.dart';

import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: StockPageMobile(),
      tablet: StockPageTablet(),
      desktop: StockPageDesktop(),
    );
  }
}
