import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/content/content_cashier_closure.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
        title: AutoSizeText(
          "Fechamento dia ${widget.dateSelected}",
          maxFontSize: 18,
          minFontSize: 12,
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
          onPressed: () {
            Modular.to.navigate('/cashierclosure/mobile/allpreviously/');
          },
        ),
      ),
      body: ContentCashierClosure(dateSelected: widget.dateSelected),
    );
  }
}
