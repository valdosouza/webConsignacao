import 'dart:io';
import 'package:flutter/material.dart';
import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/page/register/order_consignment_register_page_desktop.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/page/register/order_consignment_register_page_mobile.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/page/register/order_consignment_register_page_tablet.dart';
import 'package:flutter/services.dart';

class OrderConsginmentRegisterPage extends StatefulWidget {
  final OrderAttendanceModel orderAttendance;
  final bool historic;
  const OrderConsginmentRegisterPage({
    super.key,
    required this.orderAttendance,
    required this.historic,
  });

  @override
  State<OrderConsginmentRegisterPage> createState() =>
      _OrderConsginmentRegisterPageState();
}

class _OrderConsginmentRegisterPageState
    extends State<OrderConsginmentRegisterPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }

  @override
  dispose() {
    if (Platform.isAndroid) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: OrderConsginmentRegisterPageMobile(
        orderAttendance: widget.orderAttendance,
        historic: widget.historic,
      ),
      tablet: const OrderConsginmentRegisterPageTablet(),
      desktop: const OrderConsginmentRegisterPageDesktop(),
    );
  }
}
