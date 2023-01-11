import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/contents/content_mobile_stock_list.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/contents/content_tablet_stock_list.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/contents/content_desktop_stock_list.dart';

import 'package:flutter/material.dart';

class StockListRegister extends StatelessWidget {
  const StockListRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileStockList(),
      tablet: ContentTabletStockList(),
      desktop: ContentDesktopStockList(),
    );
  }
}
