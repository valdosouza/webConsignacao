import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/pages/stock_transfer_register_page_desktop.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/pages/stock_transfer_register_page_mobile.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/pages/stock_transfer_register_page_tablet.dart';
import 'package:flutter/material.dart';

class OrderStockTransferRegisterPage extends StatelessWidget {
  const OrderStockTransferRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OrderStockTransferRegisterPageMobile(),
      tablet: OrderStockTransferRegisterPageTablet(),
      desktop: OrderStockTransferRegisterPageDesktop(),
    );
  }
}
