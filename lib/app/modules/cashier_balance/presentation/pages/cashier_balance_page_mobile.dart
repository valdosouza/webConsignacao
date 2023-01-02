import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_bloc.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_event.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_state.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/content/cashier_balance_mobile.dart';
import 'package:appweb/app/modules/cashier_balance/cashier_balance_module.dart';
import 'package:appweb/app/modules/drawer/presentation/drawer_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierBalancePAgeMobile extends StatefulWidget {
  const CashierBalancePAgeMobile({super.key});

  @override
  State<CashierBalancePAgeMobile> createState() =>
      _CashierBalanceMobiletState();
}

class _CashierBalanceMobiletState extends State<CashierBalancePAgeMobile> {
  late MaskedTextController controller;
  late CashierBalanceBloc bloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierBalanceModule>();
    });
    DateTime now = DateTime.now();
    controller = MaskedTextController(
        mask: '00/00/0000',
        text: CashierBalanceModel.formatDate(now.toString(), "dd/MM/yyyy"));
    bloc = Modular.get<CashierBalanceBloc>();
    bloc.cashierBalance.date = controller.text;
    bloc.add(CashierBalanceMobileEvent(
        id: 1, date: bloc.cashierBalance.date, userId: 2));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
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
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomInput(
                    title: "Data",
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    controller: controller,
                    onChanged: (value) {
                      bloc.cashierBalance.date = value;
                    },
                    onFieldSubmitted: (value) {
                      bloc.add(CashierBalanceMobileEvent(
                          id: 1, date: bloc.cashierBalance.date, userId: 2));
                    },
                  ),
                  const SizedBox(height: 15),
                  const ContentMobileCashierBalance()
                ],
              ),
            );
          },
        ));
  }
}
