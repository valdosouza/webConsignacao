import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/divida_anterior_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/divida_atual_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/payment_info_dinheiro_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/payment_info_pix_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/payment_info_troco_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfo(OrderConsignmentCheckpointModel modelCheckpoint) {
  String calcInfoPayment() {
    modelCheckpoint.order.totalValue = 0;
    for (OrderConsignmentCheckpointItemsModel item in modelCheckpoint.items) {
      if (item.leftover > 0) {
        modelCheckpoint.order.totalValue +=
            ((item.qtyConsigned - item.leftover) * item.unitValue);
      }
    }
    modelCheckpoint.order.totalValue +=
        modelCheckpoint.order.previousDebiBalance;
    modelCheckpoint.order.currentDebitBalance =
        modelCheckpoint.order.totalValue;
    for (OrderConsignmentCheckpointPaymentModel item
        in modelCheckpoint.payments) {
      modelCheckpoint.order.currentDebitBalance -= item.value;
    }
    return modelCheckpoint.order.totalValue.toStringAsFixed(2);
  }

  return Container(
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            enabled: false,
            controller: TextEditingController(text: calcInfoPayment()),
            textAlign: TextAlign.center,
          ),
        ),
        paymentinfodinheiro(modelCheckpoint),
        paymentinfopix(modelCheckpoint),
        paymentinfotroco(modelCheckpoint),
        dividaanterior(modelCheckpoint),
        dividaatual(modelCheckpoint),
      ],
    ),
  );
}
