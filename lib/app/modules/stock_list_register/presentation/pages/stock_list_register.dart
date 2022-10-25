import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/content/content_mobile_stock_list_register.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/content/content_tablet_stock_list_register.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/content/content_desktop_stock_list_register.dart';

import 'package:flutter/material.dart';

class StockListRegister extends StatelessWidget {
  const StockListRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileStockListRegister(),
      tablet: ContentTabletStockListRegister(),
      desktop: ContentDesktopStockListRegister(),
    );
  }
}
