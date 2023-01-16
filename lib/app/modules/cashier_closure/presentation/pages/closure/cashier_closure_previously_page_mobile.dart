import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier/presentation/contents/content_mobile_cashier.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierClosurePreviouslyPageMobile extends StatefulWidget {
  const CashierClosurePreviouslyPageMobile({super.key});

  @override
  State<CashierClosurePreviouslyPageMobile> createState() =>
      CashierClosurePreviouslyPageMobileState();
}

class CashierClosurePreviouslyPageMobileState
    extends State<CashierClosurePreviouslyPageMobile> {
  late CashierClosureBloc bloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });
    bloc = Modular.get<CashierClosureBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Fechamento anteriores"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.navigate('/cashierclosure/mobile/');
          },
        ),
      ),
      body: const ContentMobileCashier(
        event: CashierClosureGetClosurePreviouslyEvent(
          institutionId: 1,
          userId: 2,
        ),
      ),
    );
  }
}
