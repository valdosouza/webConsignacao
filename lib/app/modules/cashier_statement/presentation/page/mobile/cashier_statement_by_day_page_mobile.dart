import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/content/content_cashier_statement_by_date.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementByDayPageMobile extends StatefulWidget {
  const CashierStatementByDayPageMobile({super.key});

  @override
  State<CashierStatementByDayPageMobile> createState() =>
      CashierStatementByDayPageMobileState();
}

class CashierStatementByDayPageMobileState
    extends State<CashierStatementByDayPageMobile> {
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
        title: const AutoSizeText(
          "Extrato do dia",
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
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
          if (state is GetCurrentDateSucessState) {
            bloc.add(CashierStatementGetByDayMobileEvent(
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
              child: ContentCashierStatementByDay(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
