// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:flutter/material.dart';

class OrderStockTransferRegisterSituationWidget extends StatefulWidget {
  const OrderStockTransferRegisterSituationWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;
  @override
  State<OrderStockTransferRegisterSituationWidget> createState() =>
      _OrderStockTransferRegisterSituationWidgetState();
}

class _OrderStockTransferRegisterSituationWidgetState
    extends State<OrderStockTransferRegisterSituationWidget> {
  late bool selectRadio;

  @override
  void initState() {
    super.initState();
    selectRadio = widget.status == 'A' ? true : false;
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
