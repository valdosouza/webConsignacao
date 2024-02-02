import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/desktop/cashier_statement_customer_by_salesman_desktop.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementSalesmanListPageDesktop extends StatefulWidget {
  const CashierStatementSalesmanListPageDesktop({super.key});

  @override
  State<CashierStatementSalesmanListPageDesktop> createState() =>
      CashierStatementSalesmanListPageDesktopState();
}

class CashierStatementSalesmanListPageDesktopState
    extends State<CashierStatementSalesmanListPageDesktop> {
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
          title: const AutoSizeText(
            "Lista de vendedores",
            style: kTitleAppBarStyle,
          ),
        ),
        body: const CashierStatementCustomerBySalesmanDesktop());
  }
}
