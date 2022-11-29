import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/attendance_sales_route/presentation/content/content_desktop_attendance_sales_route.dart';
import 'package:appweb/app/modules/attendance_sales_route/presentation/content/content_mobile_attendance_sales_route.dart';
import 'package:appweb/app/modules/attendance_sales_route/presentation/content/content_tablet_attendance_sales_route.dart';
import 'package:flutter/material.dart';

class ContentAttendanceSalesRoute extends StatelessWidget {
  const ContentAttendanceSalesRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileAttendanceSalesRoute(),
      tablet: ContentTabletAttendanceSalesRoute(),
      desktop: ContentDesktopAttendanceSalesRoute(),
    );
  }
}
