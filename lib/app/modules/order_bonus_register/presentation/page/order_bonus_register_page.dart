import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/page/order_bonus_register_page_desktop.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/page/order_bonus_register_page_mobile.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/page/order_bonus_register_page_tablet.dart';
import 'package:flutter/material.dart';

class OrderBonusRegisterPage extends StatelessWidget {
  const OrderBonusRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OrderBonusRegisterPageMobile(),
      tablet: OrderBonusRegisterPageTablet(),
      desktop: OrderBonusRegisterPageDesktop(),
    );
  }
}
