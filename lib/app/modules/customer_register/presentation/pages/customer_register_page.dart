import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/customer_register/presentation/pages/customer_register_page_desktop.dart';
import 'package:appweb/app/modules/customer_register/presentation/pages/customer_register_page_mobile.dart';
import 'package:appweb/app/modules/customer_register/presentation/pages/customer_register_page_tablet.dart';
import 'package:flutter/material.dart';

class CustomerRegisterPage extends StatelessWidget {
  const CustomerRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CustomerRegisterPageMobile(),
      tablet: CustomerRegisterPageTablet(),
      desktop: CustomerRegisterPageDesktop(),
    );
  }
}
