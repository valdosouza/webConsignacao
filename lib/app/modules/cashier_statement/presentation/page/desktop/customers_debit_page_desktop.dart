import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/custom_imput_button.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/content/content_customers_debits.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/desktop/salesman_list_desktop.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomersDebitPageDesktop extends StatefulWidget {
  const CustomersDebitPageDesktop({super.key});

  @override
  State<CustomersDebitPageDesktop> createState() =>
      CustomersDebitPageDesktopState();
}

class CustomersDebitPageDesktopState extends State<CustomersDebitPageDesktop> {
  late MaskedTextController controller;
  late CashierStatementBloc bloc;
  String title = "Débitos de Clientes";

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: AutoSizeText(
            title,
            style: kTitleAppBarStyle,
          ),
        ),
        body: BlocConsumer<CashierStatementBloc, CashierStatementState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is ErrorState) {
              CustomToast.showToast(state.msg);
            }
            if (state is ErrorState) {
              CustomToast.showToast(state.msg);
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const CustomCircularProgressIndicator();
            }

            if (state is GetSalesmanLoadedState) {
              return SalesmanListDesktop(list: bloc.salesmanList);
            }
            return Container(
              padding: const EdgeInsets.all(5.0),
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  search(),
                  ContentCustomersDebits(
                    list: bloc.customerDebits,
                    bodyHeight: 353,
                  ),
                ],
              ),
            );
          },
        ));
  }

  Container search() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomInput(
                title: "Nome do Cliente",
                initialValue: bloc.nameCustomer,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.go,
                onChanged: (value) {
                  bloc.nameCustomer = value;
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomInputButton(
                initialValue: bloc.nameSalesman,
                readOnly: true,
                enabled: true,
                title: "Nome do Vendedor",
                onAction: () => bloc.add(GetSalesmanListEvent()),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 3.0, top: 30, right: 10, bottom: 3),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(30, 50),
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  bloc.add(
                    GetCustomerOldDebitBySalesmanEvent(
                      params: CashierStatementParams(
                        date: "",
                        nameCustomer: bloc.nameCustomer,
                        tbSalesmanId: bloc.tbSalesmanId,
                        page: 0,
                      ),
                    ),
                  );
                },
                child: const Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 8),
                    Icon(Icons.manage_search_sharp, color: kSecondaryColor),
                    Text(
                      "Atualizar",
                      style: kElevatedButtonTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
