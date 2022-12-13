import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/attendance_salesman/presentation/content/content_desktop_attendance_salesman.dart';
import 'package:appweb/app/modules/attendance_salesman/presentation/content/content_mobile_attendance_salesman.dart';
import 'package:appweb/app/modules/attendance_salesman/presentation/content/content_tablet_attendance_salesman.dart';
import 'package:flutter/material.dart';

class ContentAttendanceSalesman extends StatelessWidget {
  const ContentAttendanceSalesman({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileAttendanceSalesman(),
      tablet: ContentTabletAttendanceSalesman(),
      desktop: ContentDesktopAttendanceSalesman(),
    );
  }
}
