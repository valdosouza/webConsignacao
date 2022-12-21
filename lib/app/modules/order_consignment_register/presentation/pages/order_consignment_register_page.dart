import 'package:appweb/app/modules/order_consignment_register/presentation/pages/order_consignment_register_page_desktop.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/pages/order_consignment_register_page_mobile.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/pages/order_consignment_register_page_tablet.dart';
import 'package:flutter/material.dart';
import 'package:appweb/app/core/shared/helpers/responsive.dart';

class OrderConsginmentRegisterPage extends StatelessWidget {
  const OrderConsginmentRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OrderConsginmentRegisterPageMobile(tbCustomerId: 51),
      tablet: OrderConsginmentRegisterPageTablet(),
      desktop: OrderConsginmentRegisterPageDesktop(),
    );
  }
}
