import 'package:flutter/material.dart';

import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/register/divida_atual_supplying_widget.dart';

class ExtraInfo extends StatefulWidget {
  final OrderConsignmentSupplyingModel modelSupplying;
  final Size size;
  const ExtraInfo({
    super.key,
    required this.modelSupplying,
    required this.size,
  });

  @override
  State<ExtraInfo> createState() => _ExtraInfoState();
}

class _ExtraInfoState extends State<ExtraInfo> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                    (isChecked)
                        ? widget.modelSupplying.order.recall = "S"
                        : widget.modelSupplying.order.recall = "N";
                  });
                },
              ),
              const Text("Produto recolhido"),
            ],
          ),
          Container(
            height: widget.size.height - 220,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextField(
                enabled: true,
                focusNode: null,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.none,
                controller: TextEditingController(
                    text: widget.modelSupplying.order.note),
                onChanged: (value) => {
                  widget.modelSupplying.order.note = value,
                },
              ),
            ),
          ),
          dividaatualsupplying(widget.modelSupplying),
        ],
      ),
    );
  }
}
