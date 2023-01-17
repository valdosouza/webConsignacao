import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/page/order_attendance_register_page_desktop.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/page/order_attendance_register_page_mobile.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/page/order_attendance_register_page_tablet.dart';

class OrderAttendanceRegisterPage extends StatelessWidget {
  final OrderAttendanceModel model;
  const OrderAttendanceRegisterPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: OrderAttendanceRegisterPageMobile(model: model),
      tablet: const OrderAttendanceRegisterPageTablet(),
      desktop: const OrderAttendanceRegisterPageDesktop(),
    );
  }
}
