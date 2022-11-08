import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/contents/content_desktop_sales_route_register.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/contents/content_mobile_sales_route_register.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/contents/content_tablet_sales_route_register.dart';
import 'package:flutter/material.dart';

class SalesRouteRegister extends StatelessWidget {
  const SalesRouteRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileSalesRouteRegister(),
      tablet: ContentTabletSalesRouteRegister(),
      desktop: ContentDesktopSalesRouteRegister(),
    );
  }
}
