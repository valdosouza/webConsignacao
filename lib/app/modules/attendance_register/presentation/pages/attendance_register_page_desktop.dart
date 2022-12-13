import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/attendance_sales_route/attendance_sales_route_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceRegisterPageDesktop extends StatefulWidget {
  const AttendanceRegisterPageDesktop({super.key});

  @override
  State<AttendanceRegisterPageDesktop> createState() =>
      AttendanceRegisterPageDesktopState();
}

class AttendanceRegisterPageDesktopState
    extends State<AttendanceRegisterPageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceSalesRouteModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Sistema Consignação e Venda"),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Text("Atendimento por Vendedor - Desktop"),
      ),
    );
  }
}