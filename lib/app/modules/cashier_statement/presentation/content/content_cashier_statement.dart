import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/widget/cashier_statement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentCashierStatement extends StatefulWidget {
  const ContentCashierStatement({super.key});

  @override
  State<ContentCashierStatement> createState() =>
      _ContentCashierStatementState();
}

class _ContentCashierStatementState extends State<ContentCashierStatement> {
  late CashierStatementBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierStatementBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CashierStatementBloc, CashierStatementState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CashierStatementMobileErrorState) {
            CustomToast.showToast(
                "Não foi possível acessar o extrato. Tente novamente mais tarde.");
          }
        },
        builder: (context, state) {
          if (state is CashierStatementLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (bloc.cashierStatement.isEmpty) {
            return const Center(
                child:
                    Text("Não encontramos nenhuma registro em nossas bases"));
          }
          return CustomScrollView(slivers: listOfCashier());
        });
  }

  listOfCashier() {
    List<Widget> data = List.empty(growable: true);
    bloc.cashierStatement.forEach((key, value) {
      data.add(CashierStatementWidget(
          title: (key == "summarized" ? "Totais" : key), model: value));
    });
    return data;
  }
}
