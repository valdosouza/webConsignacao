import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/pages/stock_adjustment_register_page_desktop.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/pages/stock_adjustment_register_page_mobile.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/pages/stock_adjustment_register_page_tablet.dart';
import 'package:flutter/material.dart';

class OrderStockAdjustmentRegisterPage extends StatelessWidget {
  const OrderStockAdjustmentRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OrderStockAdjustmentRegisterPageMobile(),
      tablet: OrderStockAdjustmentRegisterPageTablet(),
      desktop: OrderStockAdjustmentRegisterPageDesktop(),
    );
  }
}
