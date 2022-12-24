import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/pages/order_consignment_register_page_desktop.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/pages/order_consignment_register_page_mobile.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/pages/order_consignment_register_page_tablet.dart';

class OrderConsginmentRegisterPage extends StatefulWidget {
  final OrderAttendanceModel orderAttendance;
  const OrderConsginmentRegisterPage({
    Key? key,
    required this.orderAttendance,
  }) : super(key: key);

  @override
  State<OrderConsginmentRegisterPage> createState() =>
      _OrderConsginmentRegisterPageState();
}

class _OrderConsginmentRegisterPageState
    extends State<OrderConsginmentRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: OrderConsginmentRegisterPageMobile(
          orderAttendance: widget.orderAttendance),
      tablet: const OrderConsginmentRegisterPageTablet(),
      desktop: const OrderConsginmentRegisterPageDesktop(),
    );
  }
}
