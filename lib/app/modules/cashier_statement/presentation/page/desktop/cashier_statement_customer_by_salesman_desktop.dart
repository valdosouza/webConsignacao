import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/content/content_cashier_statement_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementCustomerBySalesmanDesktop extends StatefulWidget {
  const CashierStatementCustomerBySalesmanDesktop({super.key});

  @override
  State<CashierStatementCustomerBySalesmanDesktop> createState() =>
      CashierStatementCustomerBySalesmanDesktopState();
}

class CashierStatementCustomerBySalesmanDesktopState
    extends State<CashierStatementCustomerBySalesmanDesktop> {
  late MaskedTextController controller;
  late CashierStatementBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });
    bloc = Modular.get<CashierStatementBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: Text(
            "Vendedor: ${bloc.salesmanSelected} - Data: ${bloc.dateSelected}"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            bloc.add(ReturnSalesmanListDesktopEvent());
          },
        ),
      ),
      body: const ContentCashierStatementCustomer(),
    );
  }
}
