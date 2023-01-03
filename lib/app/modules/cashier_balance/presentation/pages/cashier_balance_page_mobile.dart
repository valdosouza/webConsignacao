import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_bloc.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_event.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_state.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/content/cashier_balance_mobile.dart';
import 'package:appweb/app/modules/cashier_balance/cashier_balance_module.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierBalancePageMobile extends StatefulWidget {
  const CashierBalancePageMobile({super.key});

  @override
  State<CashierBalancePageMobile> createState() =>
      _CashierBalanceMobiletState();
}

class _CashierBalanceMobiletState extends State<CashierBalancePageMobile> {
  late MaskedTextController controller;
  late CashierBalanceBloc bloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierBalanceModule>();
    });

    controller =
        MaskedTextController(mask: '00/00/0000', text: CustomDate.newDate());
    bloc = Modular.get<CashierBalanceBloc>();
    bloc.cashierBalance.dtRecord = controller.text;
    bloc.add(CashierBalanceMobileEvent(
      tbInstitutionId: 1,
      date: bloc.cashierBalance.dtRecord,
      tbUserId: 2,
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: const Text("Sistema Consignação e Venda"),
        ),
        drawer: const DrawerPageMobile(),
        body: BlocConsumer<CashierBalanceBloc, CashierBalanceState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is CashierBalanceMobileErrorState) {
              CustomToast.showToast(
                  "Erro ao buscar o saldo. Tente novamente mais tarde.");
            }
          },
          builder: (context, state) {
            if (state is CashierBalanceLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CashierBalanceMobileSuccessState) {
              return const ContentMobileCashierBalance();
            }
            return Container();
          },
        ));
  }
}
