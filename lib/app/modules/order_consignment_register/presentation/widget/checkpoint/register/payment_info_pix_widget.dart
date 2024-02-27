import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfopix(OrderConsignmentCheckpointModel modelCheckpoint) {
  double valor = 0;
  String valorStr = "";
  var txt = TextEditingController(
      text: (modelCheckpoint.payments[1].value > 0)
          ? floatToStrF(modelCheckpoint.payments[1].value)
          : "");
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: headerfield('Pix', 32),
      ),
      Expanded(
        flex: 4,
        child: Container(
          height: 33,
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(
              left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            controller: txt,
            onChanged: (value) {
              if (value.isNotEmpty) {
                valorStr = value.replaceAll('.', '');
                valor = double.parse(valorStr);
                txt.text = "";
                if (valor > 0) {
                  valor = valor / 100;
                  txt.text = floatToStrF(valor);
                }
              }
              txt.selection = TextSelection.fromPosition(
                  TextPosition(offset: txt.text.length));
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                modelCheckpoint.payments[1].value = double.parse(value);
              } else {
                modelCheckpoint.payments[1].value = 0.0;
              }
            },
          ),
        ),
      ),
    ],
  );
}
