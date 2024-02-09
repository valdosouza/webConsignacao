import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/historic/custom_body_supplying_historic_wiget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/register/custom_header_supplying_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/custom_button_widget.dart';

class ContentConsignmentSupplyingHistoric extends StatefulWidget {
  final OrderConsignmentSupplyingModel modelSupplying;
  const ContentConsignmentSupplyingHistoric({
    super.key,
    required this.modelSupplying,
  });

  @override
  State<ContentConsignmentSupplyingHistoric> createState() =>
      _ContentConsignmenteSupplyingState();
}

class _ContentConsignmenteSupplyingState
    extends State<ContentConsignmentSupplyingHistoric> {
  late final OrderConsignmentRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderConsignmentRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderConsignmentRegisterModule>;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 45,
                child: AutoSizeText(
                  "${widget.modelSupplying.order.dtRecord} - ${widget.modelSupplying.order.nameCustomer}",
                  style: kTitleAppBarStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const CustomHeaderSupplying(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: CustomBodySupplyingHistoricWidget(
            size: size, modelSupplying: widget.modelSupplying),
      ),
      bottomSheet: _footer(),
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
            child: custombutton("Checagem", () {
              bloc.add(GetCheckpoint(orderid: widget.modelSupplying.order.id));
            }),
          ),
          Expanded(
            flex: 1,
            child: custombutton("Sair", () {
              bloc.add(OrderConsignmentRegisterGetlistEvent(
                  tbCustomerId: widget.modelSupplying.order.tbCustomerId));
            }),
          ),
        ],
      ),
    );
  }
}
