import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/customer_register/presentation/contents/content_desktop_customer_register.dart';
import 'package:appweb/app/modules/customer_register/presentation/contents/content_mobile_customer_register.dart';
import 'package:appweb/app/modules/customer_register/presentation/contents/content_tablet_customer_register.dart';
import 'package:flutter/material.dart';

class CustomerRegisterPage extends StatelessWidget {
  const CustomerRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileCustomerRegister(),
      tablet: ContentTabletCustomerRegister(),
      desktop: ContentDesktopCustomerRegister(),
    );
  }
}
