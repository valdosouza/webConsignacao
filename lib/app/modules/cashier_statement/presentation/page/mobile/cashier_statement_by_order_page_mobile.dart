import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/content/content_cashier_statement.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementByOrderPageMobile extends StatefulWidget {
  const CashierStatementByOrderPageMobile({super.key});

  @override
  State<CashierStatementByOrderPageMobile> createState() =>
      CashierStatementByOrderPageMobileState();
}

class CashierStatementByOrderPageMobileState
    extends State<CashierStatementByOrderPageMobile> {
  late MaskedTextController controller;
  late CashierStatementBloc bloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });
    bloc = Modular.get<CashierStatementBloc>();
  }

  // @override
  // void dispose() {
  //   bloc.cashierStatement.clear();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          "Extrato do Atendimento",
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
          onPressed: () {
            Modular.to.navigate('/cashierstatement/mobile/customerscharged/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: kPrimaryColor,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Text("Cliente",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white))),
                    Expanded(
                        flex: 1,
                        child: Text("Horário",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white))),
                    Expanded(
                        flex: 1,
                        child: Text("Valor",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                          bloc.customers[bloc.customerIndex].nameCustomer)),
                  Expanded(
                      flex: 1,
                      child: Text(
                          bloc.customers[bloc.customerIndex].timeAttendace)),
                  Expanded(
                    flex: 1,
                    child: Text(
                      floatToStrF(
                          bloc.customers[bloc.customerIndex].valuerCharged),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: ContentCashierStatement())
          ],
        ),
      ),
    );
  }
}
