import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:flutter/material.dart';

class OrderAttendanceRegisterPageTablet extends StatefulWidget {
  const OrderAttendanceRegisterPageTablet({super.key});

  @override
  State<OrderAttendanceRegisterPageTablet> createState() =>
      OrderAttendancerRegisterPageMobileState();
}

class OrderAttendancerRegisterPageMobileState
    extends State<OrderAttendanceRegisterPageTablet> {
  late final CustomerRegisterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Sistema Consignação e Venda"),
      ),
      body: const Expanded(child: Text("Attendance - Tablet")),
    );
  }
}
