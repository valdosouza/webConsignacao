import 'dart:io';

import 'package:appweb/app/modules/order_sale_register/presentation/page/order_sale_register_page_desktop.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/page/order_sale_register_page_mobile.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/page/order_sale_register_page_tablet.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:flutter/services.dart';

class OrderSaleRegisterPage extends StatefulWidget {
  final OrderAttendanceModel orderAttendance;
  const OrderSaleRegisterPage({
    Key? key,
    required this.orderAttendance,
  }) : super(key: key);

  @override
  State<OrderSaleRegisterPage> createState() => _OrderSaleRegisterPageState();
}

class _OrderSaleRegisterPageState extends State<OrderSaleRegisterPage> {
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
      mobile:
          OrderSaleRegisterPageMobile(orderAttendance: widget.orderAttendance),
      tablet: const OrderSaleRegisterPageTablet(),
      desktop: const OrderSaleRegisterPageDesktop(),
    );
  }
}
