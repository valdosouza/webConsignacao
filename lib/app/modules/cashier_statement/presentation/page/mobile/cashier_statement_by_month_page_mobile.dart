import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/content/content_cashier_statement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementByMonthPageMobile extends StatefulWidget {
  const CashierStatementByMonthPageMobile({super.key});

  @override
  State<CashierStatementByMonthPageMobile> createState() =>
      CashierStatementByMonthPageMobileState();
}

class CashierStatementByMonthPageMobileState
    extends State<CashierStatementByMonthPageMobile> {
  late CashierStatementBloc bloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });

    bloc = Modular.get<CashierStatementBloc>();
    bloc.add(GetCurrentDateEvent());
  }

  @override
  void dispose() {
    bloc.cashierStatement.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Extrato do mês"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.navigate('/cashierstatement/mobile/');
          },
        ),
      ),
      body: BlocConsumer<CashierStatementBloc, CashierStatementState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is MobileErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
          if (state is GetCurrentDateSucessState) {
            bloc.add(CashierStatementGetByMonthMobileEvent(
              params: CashierStatementParams(date: bloc.dtCashierToday),
            ));
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const CustomCircularProgressIndicator();
          }
          if (state is MobileSuccessState) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: ContentCashierStatement(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
