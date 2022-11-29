import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/attendance_sales_route/presentation/pages/attendance_sales_route_page_desktop.dart';
import 'package:appweb/app/modules/attendance_sales_route/presentation/pages/attendance_sales_route_page_mobile.dart';
import 'package:appweb/app/modules/attendance_sales_route/presentation/pages/attendance_sales_route_page_tablet.dart';

import 'package:flutter/material.dart';

class AttendanceSalesRoutePage extends StatelessWidget {
  const AttendanceSalesRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: AttendanceSalesRoutePageMobile(),
      tablet: AttendanceSalesRoutePageTablet(),
      desktop: AttendanceSalesRoutePageDesktop(),
    );
  }
}
