import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/pages/order_attendance_register_page_desktop.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/pages/order_attendance_register_page_mobile.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/pages/order_attendance_register_page_tablet.dart';

class OrderAttendanceRegisterPage extends StatelessWidget {
  const OrderAttendanceRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OrderAttendanceRegisterPageMobile(tbCustomerId: 51),
      tablet: OrderAttendanceRegisterPageTablet(),
      desktop: OrderAttendanceRegisterPageDesktop(),
    );
  }
}
