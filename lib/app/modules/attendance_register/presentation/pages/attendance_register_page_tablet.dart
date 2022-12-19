import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/attendance_by_salesman/attendance_by_salesman_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceRegisterPageTablet extends StatefulWidget {
  const AttendanceRegisterPageTablet({super.key});

  @override
  State<AttendanceRegisterPageTablet> createState() =>
      AttendanceRegisterPageTabletState();
}

class AttendanceRegisterPageTabletState
    extends State<AttendanceRegisterPageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceBySalesmanModule>();
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
        child: const Text("Atendimento por Vendedor - Tablet"),
      ),
    );
  }
}
