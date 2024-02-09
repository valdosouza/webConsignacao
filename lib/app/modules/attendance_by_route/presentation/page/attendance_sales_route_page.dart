import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/page/attendance_by_route_page_desktop.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/page/attendance_by_route_page_mobile.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/page/attendance_by_route_page_tablet.dart';

class AttendanceSalesRoutePage extends StatelessWidget {
  final int tbSalesRouteId;
  final String nameSalesRoute;
  final int tbRegionId;
  final String nameRegion;
  const AttendanceSalesRoutePage({
    super.key,
    required this.tbSalesRouteId,
    required this.nameSalesRoute,
    required this.tbRegionId,
    required this.nameRegion,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: AttendanceByRoutePageMobile(
        tbSalesRouteId: tbSalesRouteId,
        nameSalesRoute: nameSalesRoute,
        tbRegionId: tbRegionId,
        nameRegion: nameRegion,
      ),
      tablet: const AttendanceByRoutePageTablet(),
      desktop: const AttendanceByRoutePageDesktop(),
    );
  }
}
