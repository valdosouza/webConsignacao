import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/contents/content_cashier_statement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementByDayPageMobile extends StatefulWidget {
  const CashierStatementByDayPageMobile({super.key});

  @override
  State<CashierStatementByDayPageMobile> createState() =>
      CashierStatementByDayPageMobileState();
}

class CashierStatementByDayPageMobileState
    extends State<CashierStatementByDayPageMobile> {
  late MaskedTextController controller;
  late CashierStatementBloc bloc;
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
          title: const Text("Extrato do dia"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Modular.to.navigate('/cashierstatement/mobile/');
            },
          ),
        ),
        body: BlocBuilder<CashierStatementBloc, CashierStatementState>(
          bloc: bloc,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomInput(
                    title: "Data",
                    keyboardType: TextInputType.datetime,
                    inputAction: TextInputAction.done,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {
                      bloc.add(CashierStatementGetByDayMobileEvent(
                          params: CashierStatementParams(
                              tbInstitutionId: 1, date: value, tbUserId: 2)));
                    },
                    controller: controller,
                  ),
                  const Expanded(child: ContentCashierStatement())
                ],
              ),
            );
          },
        ));
  }
}
