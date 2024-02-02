import 'package:appweb/app/core/shared/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

class OrderStockTransferRegisterPageMobile extends StatefulWidget {
  const OrderStockTransferRegisterPageMobile({super.key});

  @override
  State<OrderStockTransferRegisterPageMobile> createState() =>
      OrderStockTransferRegisterPageMobileState();
}

class OrderStockTransferRegisterPageMobileState
    extends State<OrderStockTransferRegisterPageMobile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          "Ordem de Transferência de estoque",
          style: kTitleAppBarStyle,
        ),
      ),
    );
  }
}
