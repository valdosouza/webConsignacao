// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';

class OrderProductionRegisterSituationWidget extends StatefulWidget {
  final OrderProductionRegisterModel orderProduction;
  const OrderProductionRegisterSituationWidget({
    Key? key,
    required this.orderProduction,
  }) : super(key: key);

  @override
  State<OrderProductionRegisterSituationWidget> createState() =>
      _OrderProductionRegisterSituationWidgetState();
}

class _OrderProductionRegisterSituationWidgetState
    extends State<OrderProductionRegisterSituationWidget> {
  late bool selectRadio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectRadio = widget.orderProduction.status == 'A' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Radio(
                value: true,
                groupValue: selectRadio,
                activeColor: Colors.red,
                onChanged: (value) {}),
            const SizedBox(width: 5.0),
            const Text("Aberto", style: kLabelStyle),
          ],
        ),
        const SizedBox(width: 10.0),
        Row(
          children: [
            Radio(
                value: false,
                groupValue: selectRadio,
                activeColor: Colors.red,
                onChanged: (value) {}),
            const SizedBox(width: 5.0),
            const Text("Fechado", style: kLabelStyle),
          ],
        ),
      ],
    );
  }
}
