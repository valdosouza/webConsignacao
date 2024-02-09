import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/historic/divida_atual_supplying_historic_widget.dart';
import 'package:flutter/material.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';

class ExtraInfoHistoric extends StatefulWidget {
  final OrderConsignmentSupplyingModel modelSupplying;
  final Size size;
  const ExtraInfoHistoric({
    super.key,
    required this.modelSupplying,
    required this.size,
  });

  @override
  State<ExtraInfoHistoric> createState() => _ExtraInfoHistoricState();
}

class _ExtraInfoHistoricState extends State<ExtraInfoHistoric> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (widget.modelSupplying.order.recall == "S")
              ? const Text("Produto recolhido")
              : const Text("Operação Normal"),
          Container(
            height: widget.size.height - 220,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextFormField(
                initialValue: widget.modelSupplying.order.note,
                enabled: false,
                focusNode: null,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.none,
              ),
            ),
          ),
          dividaatualsupplyinghistoric(widget.modelSupplying),
        ],
      ),
    );
  }
}
