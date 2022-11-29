import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/attendance_sales_route/attendance_sales_route_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceSalesRoutePageDesktop extends StatefulWidget {
  const AttendanceSalesRoutePageDesktop({super.key});

  @override
  State<AttendanceSalesRoutePageDesktop> createState() =>
      AttendanceSalesRoutePageDesktopState();
}

class AttendanceSalesRoutePageDesktopState
    extends State<AttendanceSalesRoutePageDesktop> {
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
        child: const Text("Atendimento por Rota de Venda - Desktop"),
      ),
    );
  }
}
