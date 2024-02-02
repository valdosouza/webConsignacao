import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/attendance_by_route/attendance_by_route_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceByRoutePageTablet extends StatefulWidget {
  const AttendanceByRoutePageTablet({super.key});

  @override
  State<AttendanceByRoutePageTablet> createState() =>
      AttendanceByRoutePageTabletState();
}

class AttendanceByRoutePageTabletState
    extends State<AttendanceByRoutePageTablet> {
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
        title: kAppTitle,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Text("Atendimento por Rota de Venda - Tablet"),
      ),
    );
  }
}
