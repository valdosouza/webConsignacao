import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/payment_info_dinheiro_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/payment_info_pix_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/payment_info_troco_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/divida_anterior_checkpoint_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/divida_atual_checkpoint_widget.dart';
import 'package:flutter/material.dart';

Widget paymentinfo(OrderConsignmentCheckpointModel modelCheckpoint) {
  String calcInfoPayment() {
    modelCheckpoint.order.totalValue = 0;
    for (OrderConsignmentCheckpointCardModel item in modelCheckpoint.items) {
      modelCheckpoint.order.totalValue += item.subtotal;
    }
    modelCheckpoint.order.totalValue +=
        modelCheckpoint.order.previousDebiBalance;
    modelCheckpoint.order.currentDebitBalance =
        modelCheckpoint.order.totalValue;
    for (OrderPaidModel item in modelCheckpoint.payments) {
      modelCheckpoint.order.currentDebitBalance -= item.value;
      if (modelCheckpoint.order.currentDebitBalance < 0) {
        modelCheckpoint.order.currentDebitBalance = 0;
        break;
      }
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
          height: 35,
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
