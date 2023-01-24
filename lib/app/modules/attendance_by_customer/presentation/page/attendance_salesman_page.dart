import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/page/attendance_by_customer_page_desktop.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/page/attendance_by_customer_page_mobile.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/page/attendance_by_customer_page_tablet.dart';

import 'package:flutter/material.dart';

class AttendanceCustomerPage extends StatelessWidget {
  const AttendanceCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: AttendanceByCustomerPageMobile(),
      tablet: AttendanceByCustomerPageTablet(),
      desktop: AttendanceByCustomerPageDesktop(),
    );
  }
}
