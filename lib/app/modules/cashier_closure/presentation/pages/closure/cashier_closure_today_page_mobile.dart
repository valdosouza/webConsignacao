import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier/presentation/content/content_mobile_cashier.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierClosureTodayPageMobile extends StatefulWidget {
  const CashierClosureTodayPageMobile({super.key});

  @override
  State<CashierClosureTodayPageMobile> createState() =>
      CashierClosureTodayPageMobileState();
}

class CashierClosureTodayPageMobileState
    extends State<CashierClosureTodayPageMobile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });
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
      ),
      body: ContentMobileCashier(
        event: CashierClosureGetClosureEvent(
          institutionId: 1,
          userId: 2,
          date: DateTime.now(),
        ),
      ),
    );
  }
}
