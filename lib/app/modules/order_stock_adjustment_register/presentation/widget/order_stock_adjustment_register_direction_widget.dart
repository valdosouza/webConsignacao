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
    return Row(
      children: [
        Row(
          children: [
            Radio(
              value: true,
              groupValue: selectRadio,
              activeColor: Colors.red,
              onChanged: (widget.orderStockAdjust.status != "F")
                  ? selectRadio
                      ? (value) {}
                      : (value) {
                          setState(() {
                            selectRadio = true;
                            widget.orderStockAdjust.direction = "E";
                          });
                        }
                  : null,
            ),
            const SizedBox(width: 5.0),
            const Text("Entrada", style: kLabelStyle),
          ],
        ),
        const SizedBox(width: 10.0),
        Row(
          children: [
            Radio(
                value: false,
                groupValue: selectRadio,
                activeColor: Colors.red,
                onChanged: (widget.orderStockAdjust.status != "F")
                    ? selectRadio
                        ? (value) {
                            setState(() {
                              selectRadio = false;
                              widget.orderStockAdjust.direction = "S";
                            });
                          }
                        : (value) {}
                    : null),
            const SizedBox(width: 5.0),
            const Text("Saída", style: kLabelStyle),
          ],
        ),
      ],
    );
  }
}
