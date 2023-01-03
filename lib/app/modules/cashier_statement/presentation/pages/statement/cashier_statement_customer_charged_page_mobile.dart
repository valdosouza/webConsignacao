import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementCustomerChargedPageMobile extends StatefulWidget {
  const CashierStatementCustomerChargedPageMobile({super.key});

  @override
  State<CashierStatementCustomerChargedPageMobile> createState() =>
      CashierStatementCustomerChargedPageMobileState();
}

class CashierStatementCustomerChargedPageMobileState
    extends State<CashierStatementCustomerChargedPageMobile> {
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
        title: const Text("Clientes Cobrados"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.navigate('/cashierstatement/mobile/');
          },
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: const Center(
            child: Text("Extrato por dia"),
          ),
        ),
      ),
    );
  }
}
