import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier_statement_summary/cashier_statement_summary_module.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/event.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/content/content_salesman_list.dart';

class SalesmanListDesktop extends StatefulWidget {
  final List<SalesmanModel> list;
  const SalesmanListDesktop({
    super.key,
    required this.list,
  });

  @override
  State<SalesmanListDesktop> createState() => SalesmanListDesktopState();
}

class SalesmanListDesktopState extends State<SalesmanListDesktop> {
  late CashierStatementSummaryBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementSummaryModule>();
    });
    bloc = Modular.get<CashierStatementSummaryBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          "Lista de Vendedores",
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            bloc.tbSalesmanId = 0;
            bloc.nameSalesman = "";
            bloc.add(MainFormEvent());
          },
        ),
      ),
      body: ContentSalesmanList(list: bloc.salesmanList),
    );
  }
}
