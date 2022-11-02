import 'package:flutter/cupertino.dart';
import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/content/content_desktop_sales.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/content/content_mobile_sales.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/content/content_tablet_sales.dart';

class SalesRouteRegister extends StatelessWidget {
  const SalesRouteRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileSales(),
      tablet: ContentTabletSales(),
      desktop: ContentDesktopSales(),
    );
  }
}
