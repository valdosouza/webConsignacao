import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/stock/presentation/page/stock_page_desktop.dart';
import 'package:appweb/app/modules/stock/presentation/page/stock_page_mobile.dart';
import 'package:appweb/app/modules/stock/presentation/page/stock_page_tablet.dart';

import 'package:flutter/material.dart';

class StocPage extends StatelessWidget {
  const StocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: StocPageMobile(),
      tablet: StocPageTablet(),
      desktop: StocPageDesktop(),
    );
  }
}
