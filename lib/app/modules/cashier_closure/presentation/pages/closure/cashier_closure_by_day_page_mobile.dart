import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/contents/content_cashier_closure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';

class CashierClosureByDayPageMobile extends StatefulWidget {
  const CashierClosureByDayPageMobile({
    Key? key,
    required this.dateSelected,
  }) : super(key: key);
  final String dateSelected;
  @override
  State<CashierClosureByDayPageMobile> createState() =>
      CashierClosureByDayPageMobileState();
}

class CashierClosureByDayPageMobileState
    extends State<CashierClosureByDayPageMobile> {
  CashierClosureByDayPageMobileState();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierClosureModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: Text("Fechamento do dia ${widget.dateSelected}"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.navigate('/cashierclosure/mobile/allpreviously/');
          },
        ),
      ),
      body: ContentCashierClosure(dateSelected: widget.dateSelected),
    );
  }
}
