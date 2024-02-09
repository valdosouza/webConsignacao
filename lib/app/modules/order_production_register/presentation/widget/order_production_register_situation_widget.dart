// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';

class OrderProductionRegisterSituationWidget extends StatefulWidget {
  final OrderProductionRegisterModel orderProduction;
  const OrderProductionRegisterSituationWidget({
    super.key,
    required this.orderProduction,
  });

  @override
  State<OrderProductionRegisterSituationWidget> createState() =>
      _OrderProductionRegisterSituationWidgetState();
}

class _OrderProductionRegisterSituationWidgetState
    extends State<OrderProductionRegisterSituationWidget> {
  late bool selectRadio;

  @override
  void initState() {
    super.initState();
    selectRadio = widget.orderProduction.status == 'A' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.orderProduction.status != "F") {
      return const Text("Aberto", style: kLabelStyle);
    } else {
      return const Text("Fechado", style: kLabelStyle);
    }
  }
}
