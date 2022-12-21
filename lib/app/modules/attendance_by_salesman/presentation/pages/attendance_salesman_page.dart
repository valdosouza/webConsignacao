import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/pages/attendance_by_salesman_page_desktop.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/pages/attendance_by_salesman_page_mobile.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/pages/attendance_by_salesman_page_tablet.dart';

import 'package:flutter/material.dart';

class AttendanceSalesmanPage extends StatelessWidget {
  const AttendanceSalesmanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: AttendanceBySalesmanPageMobile(),
      tablet: AttendanceBySalesmanPageTablet(),
      desktop: AttendanceBySalesmanPageDesktop(),
    );
  }
}
