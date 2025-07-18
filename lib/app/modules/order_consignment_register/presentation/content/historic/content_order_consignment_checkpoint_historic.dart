import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/historic/custom_body_checkpoint_historic_wiget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/custom_header_checkpoint_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';

class ContentConsignmentCheckpointHistoric extends StatefulWidget {
  final OrderConsignmentCheckpointModel checkpointmodel;
  const ContentConsignmentCheckpointHistoric({
    super.key,
    required this.checkpointmodel,
  });

  @override
  State<ContentConsignmentCheckpointHistoric> createState() =>
      _ContentConsignmenteCheckpointState();
}

class _ContentConsignmenteCheckpointState
    extends State<ContentConsignmentCheckpointHistoric> {
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
                  "${widget.checkpointmodel.order.dtRecord}   ${widget.checkpointmodel.order.hrRecord} - ${widget.checkpointmodel.order.nameCustomer}",
                  style: kTitleAppBarStyle,
                  textAlign: TextAlign.center,
                  maxFontSize: 18,
                  minFontSize: 12,
                ),
              ),
              const CustomHeaderCheckpoint(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: CustomBodyCheckpointHistoricWidget(
            size: size, modelCheckpoint: widget.checkpointmodel),
      ),
      bottomSheet: _footer(),
    );
  }

  SizedBox _footer() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: _custombutton("Abastecimento", () {
              bloc.add(GetSupplying(orderid: widget.checkpointmodel.order.id));
            }),
          ),
          Expanded(
            flex: 1,
            child: _custombutton("Sair", () {
              bloc.add(OrderConsignmentRegisterGetlistEvent(
                  tbCustomerId: widget.checkpointmodel.order.tbCustomerId));
            }),
          ),
        ],
      ),
    );
  }

  Padding _custombutton(String buttonName, Function() function) {
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
