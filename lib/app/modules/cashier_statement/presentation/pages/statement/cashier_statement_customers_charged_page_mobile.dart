import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/widgets/cashier_statement_customers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementCustomersChargedPageMobile extends StatefulWidget {
  const CashierStatementCustomersChargedPageMobile({super.key});

  @override
  State<CashierStatementCustomersChargedPageMobile> createState() =>
      CashierStatementCustomersChargedPageMobileState();
}

class CashierStatementCustomersChargedPageMobileState
    extends State<CashierStatementCustomersChargedPageMobile> {
  late MaskedTextController controller;
  late CashierStatementBloc bloc;
  String title = "Clientes Cobrados";
  String date = "00/00/0000";
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });
    var initialDate = CustomDate.newDate();
    bloc = Modular.get<CashierStatementBloc>();
    if (bloc.cashierStatement.isEmpty) {
      bloc.add(
        CashierStatementGetCustomersMobileEvent(
          params: CashierStatementParams(
            date: initialDate,
          ),
        ),
      );
    }
  }

  // @override
  // void dispose() {
  //   bloc.cashierStatement.clear();
  //   bloc.customers.clear();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: Text(title),
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
            if (state is CashierStatementCustomerMobileErrorState) {
              CustomToast.showToast(
                  "Não foi possível acessar os clientes. Tente novamente mais tarde");
            }
            if (state is CashierStatementMobileErrorState) {
              CustomToast.showToast(
                  "Não foi possível acessar o extrato. Tente novamente mais tarde");
            }
          },
          builder: (context, state) {
            if (state is CashierStatementLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CashierStatementCustomerWidget(date: date),
            );
          },
        ));
  }
}
