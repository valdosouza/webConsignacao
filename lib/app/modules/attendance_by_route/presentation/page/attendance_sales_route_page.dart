import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/page/attendance_by_route_page_desktop.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/page/attendance_by_route_page_mobile.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/page/attendance_by_route_page_tablet.dart';

import 'package:flutter/material.dart';

class AttendanceSalesRoutePage extends StatelessWidget {
  final int tbSalesRouteId;
  const AttendanceSalesRoutePage({super.key, required this.tbSalesRouteId});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: AttendanceByRoutePageMobile(tbSalesRouteId: tbSalesRouteId),
      tablet: const AttendanceByRoutePageTablet(),
      desktop: const AttendanceByRoutePageDesktop(),
    );
  }
}
