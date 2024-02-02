import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:flutter/material.dart';

class OrderConsginmentRegisterPageTablet extends StatefulWidget {
  const OrderConsginmentRegisterPageTablet({super.key});

  @override
  State<OrderConsginmentRegisterPageTablet> createState() =>
      OrderConsginmentRegisterPageMobileState();
}

class OrderConsginmentRegisterPageMobileState
    extends State<OrderConsginmentRegisterPageTablet> {
  late final CustomerRegisterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: kAppTitle,
      ),
      body: const Expanded(child: Text("Consignação - Tablet")),
    );
  }
}
