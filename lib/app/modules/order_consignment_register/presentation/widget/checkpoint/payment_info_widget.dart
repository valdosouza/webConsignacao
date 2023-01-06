import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/payment_info_dinheiro_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/payment_info_pix_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/payment_info_troco_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/divida_anterior_checkpoint_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/divida_atual_checkpoint_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfo(OrderConsignmentCheckpointModel modelCheckpoint) {
  String calcInfoPayment() {
    modelCheckpoint.order.totalValue = 0;
    for (OrderConsignmentCheckpointCardModel item in modelCheckpoint.items) {
      if (item.leftover > 0) {
        modelCheckpoint.order.totalValue +=
            ((item.qtyConsigned - item.leftover) * item.unitValue);
      }
    }
    modelCheckpoint.order.totalValue +=
        modelCheckpoint.order.previousDebiBalance;
    modelCheckpoint.order.currentDebitBalance =
        modelCheckpoint.order.totalValue;
    for (OrderPaidModel item in modelCheckpoint.payments) {
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
        dividaanteriorcheckpoint(modelCheckpoint),
        dividaatualcheckpoint(modelCheckpoint),
      ],
    ),
  );
}
