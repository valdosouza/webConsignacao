import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/customer/presentation/content/content_mobile_customer.dart';
import 'package:appweb/app/modules/customer/presentation/content/content_tablet_customer.dart';
import 'package:appweb/app/modules/stock/presentation/content/content_desktop_stock.dart';
import 'package:flutter/material.dart';

class ContentCustomer extends StatelessWidget {
  const ContentCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileCustomer(),
      tablet: ContentTabletCustomer(),
      desktop: ContentDesktopStock(),
    );
  }
}
