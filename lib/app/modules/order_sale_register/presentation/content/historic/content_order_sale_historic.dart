import 'package:appweb/app/modules/order_sale_register/presentation/widget/historic/ordersale/custom_body_order_sale_historic_wiget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';

import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/custom_header_order_sale_widget.dart';

class ContentOrderSaleHistoric extends StatefulWidget {
  final OrderSaleMainCardModel model;
  const ContentOrderSaleHistoric({
    super.key,
    required this.model,
  });

  @override
  State<ContentOrderSaleHistoric> createState() =>
      _ContentOrderSaleHistoricState();
}

class _ContentOrderSaleHistoricState extends State<ContentOrderSaleHistoric> {
  late final OrderSaleRegisterBloc bloc;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderSaleRegisterModule>;
    });

    bloc = Modular.get<OrderSaleRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool keyboardHide = (MediaQuery.of(context).viewInsets.bottom == 0);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 40,
                child: AutoSizeText(
                  "${widget.model.order.dtRecord}  ${widget.model.order.hrRecord} - ${widget.model.order.nameCustomer}",
                  style: kTitleAppBarStyle,
                  textAlign: TextAlign.center,
                  maxFontSize: 18,
                  minFontSize: 12,
                ),
              ),
              const CustomHeaderOrderSale(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: CustomBodyOrderSaleHistoricWidget(
            size: size, modelOrdersale: widget.model),
      ),
      bottomSheet: (keyboardHide) ? _footer() : null,
    );
  }

  _footer() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: _custombutton(
                "Voltar", (() => {bloc.add(OrderGetBackToGetlistEvent())})),
          ),
        ],
      ),
    );
  }

  _custombutton(String buttonName, Function() function) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
      child: ElevatedButton(
        style: kElevatedButtonStyleRed,
        onPressed: () {
          function();
          setState(() {});
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              left: 2.0, top: 0.0, right: 2.0, bottom: 0.0),
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
          ),
          child: Text(
            buttonName,
            style: kElevatedButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
