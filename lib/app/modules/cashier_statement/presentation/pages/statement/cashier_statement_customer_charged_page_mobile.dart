import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_state.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/contents/content_cashier_statement.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/widgets/cashier_statement_customers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementCustomerChargedPageMobile extends StatefulWidget {
  const CashierStatementCustomerChargedPageMobile({super.key});

  @override
  State<CashierStatementCustomerChargedPageMobile> createState() =>
      CashierStatementCustomerChargedPageMobileState();
}

class CashierStatementCustomerChargedPageMobileState
    extends State<CashierStatementCustomerChargedPageMobile> {
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
    controller = MaskedTextController(mask: '00/00/0000');
    bloc = Modular.get<CashierStatementBloc>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.cashierStatement.clear();
    bloc.customers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
            if (state is CashierBalanceMobileSuccessState) {
              setState(() {
                title = "Extrato Cliente";
              });
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: ContentCashierStatement(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomInput(
                    title: "Data",
                    keyboardType: TextInputType.datetime,
                    inputAction: TextInputAction.done,
                    onChanged: (value) {
                      date = value;
                    },
                    controller: controller,
                  ),
                  Expanded(child: CashierStatementCustomerWidget(date: date))
                ],
              ),
            );
          },
        ));
  }
}
