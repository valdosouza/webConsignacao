import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier/cashier_module.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/content/content_cashier_statement_salesman_list.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/desktop/cashier_statement_customer_by_salesman_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementPageDesktop extends StatefulWidget {
  const CashierStatementPageDesktop({super.key});

  @override
  State<CashierStatementPageDesktop> createState() =>
      CashierStatementPageDesktopState();
}

class CashierStatementPageDesktopState
    extends State<CashierStatementPageDesktop> {
  late CashierStatementBloc bloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierModule>();
    });
    bloc = Modular.get<CashierStatementBloc>();

    bloc.add(
      GetSalesmanDesktopEvent(
        params: CashierStatementParams(
          date: bloc.dateSelected,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: const Text("Clientes Atendidos"),
        ),
        body: BlocConsumer<CashierStatementBloc, CashierStatementState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is SalesmanDesktopErrorState) {
              CustomToast.showToast(
                  "Não foi possível acessar os dados. Tente novamente mais tarde");
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const CustomCircularProgressIndicator();
            }
            if (state is ByCustomerDesktopSucessState) {
              return const CashierStatementCustomerBySalesmanDesktop();
            }
            return const ContentCashierStatementSalesmanList();
          },
        ));
  }
}
