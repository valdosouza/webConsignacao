import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:flutter/material.dart';

class OrderLoadCardRegisterPageTablet extends StatefulWidget {
  const OrderLoadCardRegisterPageTablet({super.key});

  @override
  State<OrderLoadCardRegisterPageTablet> createState() =>
      OrderSaleRegisterPageMobileState();
}

class OrderSaleRegisterPageMobileState
    extends State<OrderLoadCardRegisterPageTablet> {
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
      body: const Expanded(child: Text("Vendas - Tablet")),
    );
  }
}
