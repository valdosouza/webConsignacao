import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_production/presentation/pages/order_production_page_desktop.dart';
import 'package:appweb/app/modules/order_production/presentation/pages/order_production_page_mobile.dart';
import 'package:appweb/app/modules/order_production/presentation/pages/order_production_page_tablet.dart';
import 'package:flutter/material.dart';

class OrderProductionPage extends StatelessWidget {
  const OrderProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OrderProductionPageMobile(),
      tablet: OrderProductionPageTablet(),
      desktop: OrderProductionPageDesktop(),
    );
  }
}
