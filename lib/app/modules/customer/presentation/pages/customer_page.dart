import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/customer/presentation/pages/customer_page_desktop.dart';
import 'package:appweb/app/modules/customer/presentation/pages/customer_page_mobile.dart';
import 'package:appweb/app/modules/customer/presentation/pages/customer_page_tablet.dart';

import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CustomerPageMobile(),
      tablet: CustomerPageTablet(),
      desktop: CustomerPageDesktop(),
    );
  }
}
