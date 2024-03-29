import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/content/content_cashier_closure.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          "Fechamento de Ontem",
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () async => Modular.to.navigate('/cashierclosure/mobile/'),
        ),
      ),
      body: ContentCashierClosure(
        dateSelected: CustomDate.yesterday(""),
      ),
    );
  }
}
