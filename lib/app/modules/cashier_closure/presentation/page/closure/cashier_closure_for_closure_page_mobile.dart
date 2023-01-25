import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/content/content_cashier_for_closure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../bloc/cashier_closure_event.dart';
import '../../bloc/cashier_closure_state.dart';

class CashierClosureForClosurePageMobile extends StatefulWidget {
  const CashierClosureForClosurePageMobile({super.key});

  @override
  State<CashierClosureForClosurePageMobile> createState() =>
      CashierClosureForClosurePageMobileState();
}

class CashierClosureForClosurePageMobileState
    extends State<CashierClosureForClosurePageMobile> {
  late CashierClosureBloc bloc;

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierClosureModule>();
    });
    bloc = Modular.get<CashierClosureBloc>();
    bloc.add(CashierClosureGetCurrentDateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Fechamento de Hoje"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.navigate('/cashierclosure/mobile/');
          },
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: (() => bloc.add(CashierClosurePostClosureEvent())),
                value: 0,
                child: const Text("Enceramento"),
              )
            ],
          ),
        ],
      ),
      body: BlocConsumer<CashierClosureBloc, CashierClosureState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is MobileErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
          if (state is PostSucessState) {
            CustomToast.showToast(state.message);
          }

          if (state is GetCurrentDateSucessState) {
            bloc.add(
              CashierClosureGetForClosureEvent(date: bloc.dtCashier),
            );
          }
        },
        builder: (context, state) {
          if (state is CashierClosureLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: ContentCashierForClosure(),
          );
        },
      ),
    );
  }
}
