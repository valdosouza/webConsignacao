import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/content/content_salesman_list.dart';

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
