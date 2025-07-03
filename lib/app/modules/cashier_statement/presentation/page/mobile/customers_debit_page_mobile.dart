import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/content/content_customers_debits.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomersDebitPageMobile extends StatefulWidget {
  const CustomersDebitPageMobile({super.key});

  @override
  State<CustomersDebitPageMobile> createState() =>
      CustomersDebitPageMobileState();
}

class CustomersDebitPageMobileState extends State<CustomersDebitPageMobile> {
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined,
                color: kSecondaryColor),
            onPressed: () {
              Modular.to.navigate('/cashierstatement/mobile/');
            },
          ),
        ),
        body: BlocConsumer<CashierStatementBloc, CashierStatementState>(
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
            return SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  search(),
                  ContentCustomersDebits(
                      list: bloc.customerDebits, bodyHeight: 283),
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
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              initialValue: bloc.nameCustomer,
              onChanged: (value) {
                bloc.nameCustomer = value;
              },
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: "Pesquise por Cliente",
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              hoverColor: Colors.transparent,
              onPressed: () {
                bloc.add(
                  GetCustomerOldDebitBySalesmanEvent(
                    params: CashierStatementParams(
                      date: "",
                      nameCustomer: bloc.nameCustomer,
                      page: 0,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                //size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
