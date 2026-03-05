// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:flutter/material.dart';

class OrderStockAdjustmentRegisterDirectionWidget extends StatefulWidget {
  final OrderStockAdjustmentRegisterModel orderStockAdjust;
  const OrderStockAdjustmentRegisterDirectionWidget({
    super.key,
    required this.orderStockAdjust,
  });

  @override
  State<OrderStockAdjustmentRegisterDirectionWidget> createState() =>
      _OrderStockAdjustmentRegisterDirectionWidgetState();
}

class _OrderStockAdjustmentRegisterDirectionWidgetState
    extends State<OrderStockAdjustmentRegisterDirectionWidget> {
  late bool selectRadio;
  late bool active;

  @override
  void initState() {
    super.initState();
    selectRadio = widget.orderStockAdjust.direction == 'E' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    active = widget.orderStockAdjust.direction == 'E' ? true : false;
    final bool enabled = widget.orderStockAdjust.status != "F";
    return IgnorePointer(
      ignoring: !enabled,
      child: RadioGroup<bool>(
        groupValue: selectRadio,
        onChanged: (bool? value) {
          if (value != null) {
            setState(() {
              selectRadio = value;
              widget.orderStockAdjust.direction = value ? "E" : "S";
            });
          }
        },
        child: Row(
        children: [
          Row(
            children: [
              Radio<bool>(value: true, activeColor: Colors.red),
              const SizedBox(width: 5.0),
              const Text("Entrada", style: kLabelStyle),
            ],
          ),
          const SizedBox(width: 10.0),
          Row(
            children: [
              Radio<bool>(value: false, activeColor: Colors.red),
              const SizedBox(width: 5.0),
              const Text("Saída", style: kLabelStyle),
            ],
          ),
        ],
        ),
      ),
    );
  }
}
