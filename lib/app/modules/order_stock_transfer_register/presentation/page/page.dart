import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/page/page_desktop.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/page/page_mobile.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/page/page_tablet.dart';
import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: PageMobile(),
      tablet: PageTablet(),
      desktop: PageDesktop(),
    );
  }
}
