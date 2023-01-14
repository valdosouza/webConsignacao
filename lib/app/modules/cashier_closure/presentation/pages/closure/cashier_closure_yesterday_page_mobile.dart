import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier/presentation/content/content_mobile_cashier.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierClosureYesterdayPageMobile extends StatefulWidget {
  const CashierClosureYesterdayPageMobile({super.key});

  @override
  State<CashierClosureYesterdayPageMobile> createState() =>
      CashierClosureYesterdayPageMobileState();
}

class CashierClosureYesterdayPageMobileState
    extends State<CashierClosureYesterdayPageMobile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Fechamento de Ontem"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.navigate('/cashierclosure/mobile/');
          },
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: ContentMobileCashier(
            event: CashierClosureGetClosureEvent(
              institutionId: 1,
              userId: 2,
              date: DateTime.now().subtract(
                const Duration(days: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
