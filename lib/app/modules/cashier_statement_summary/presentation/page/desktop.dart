import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier_statement_summary/cashier_statement_summary_module.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/state.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/content/content_summary.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/page/salesman_list_desktop.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => DesktopState();
}

class DesktopState extends State<Desktop> {
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
            "Resumo mensal de operações",
            style: kTitleAppBarStyle,
          ),
        ),
        body: BlocConsumer<CashierStatementSummaryBloc,
            CashierStatementSummaryState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is ErrorState) {
              CustomToast.showToast(state.msg);
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const CustomCircularProgressIndicator();
            }
            if (state is MainFormLoadedState) {
              return ContentSummary(list: bloc.summaryList);
            }
            if (state is GetSalesmanLoadedState) {
              return SalesmanListDesktop(list: bloc.salesmanList);
            }
            return ContentSummary(list: bloc.summaryList);
          },
        ));
  }
}
