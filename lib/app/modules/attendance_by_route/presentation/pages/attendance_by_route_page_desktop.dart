import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/attendance_by_route/attendance_by_route_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceByRoutePageDesktop extends StatefulWidget {
  const AttendanceByRoutePageDesktop({super.key});

  @override
  State<AttendanceByRoutePageDesktop> createState() =>
      AttendanceByRoutePageDesktopState();
}

class AttendanceByRoutePageDesktopState
    extends State<AttendanceByRoutePageDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceByRouteModule>();
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
