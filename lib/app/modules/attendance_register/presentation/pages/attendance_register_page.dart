import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/attendance_register/presentation/pages/attendance_register_page_desktop.dart';
import 'package:appweb/app/modules/attendance_register/presentation/pages/attendance_register_page_mobile.dart';
import 'package:appweb/app/modules/attendance_register/presentation/pages/attendance_register_page_tablet.dart';

import 'package:flutter/material.dart';

class AttendanceRegisterPage extends StatelessWidget {
  const AttendanceRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: AttendanceRegisterPageMobile(),
      tablet: AttendanceRegisterPageTablet(),
      desktop: AttendanceRegisterPageDesktop(),
    );
  }
}
