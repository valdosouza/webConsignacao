import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';

import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/widget/cashier_statement_customers_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
  String title = "Clientes Atendidos";

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

  @override
  Widget build(BuildContext context) {
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

            return const CashierStatementCustomerWidget();
          },
        ));
  }
}
