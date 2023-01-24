import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/attendance_by_customer/attendance_by_customer_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceByCustomerPageTablet extends StatefulWidget {
  const AttendanceByCustomerPageTablet({super.key});

  @override
  State<AttendanceByCustomerPageTablet> createState() =>
      AttendanceByCustomerPageTabletState();
}

class AttendanceByCustomerPageTabletState
    extends State<AttendanceByCustomerPageTablet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceByCustomerModule>();
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
        child: const Text("Atendimento por Cliente - Tablet"),
      ),
    );
  }
}
