// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:flutter/material.dart';

class OrderStockAdjustmentRegisterDirectionWidget extends StatefulWidget {
  final OrderStockAdjustmentRegisterModel orderStockTransfer;
  const OrderStockAdjustmentRegisterDirectionWidget({
    Key? key,
    required this.orderStockTransfer,
  }) : super(key: key);

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
    selectRadio = widget.orderStockTransfer.direction == 'E' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    active = widget.orderStockTransfer.direction == 'E' ? true : false;
    return Row(
      children: [
        Row(
          children: [
            Radio(
              value: true,
              groupValue: selectRadio,
              activeColor: Colors.red,
              onChanged: (widget.orderStockTransfer.status == "A")
                  ? selectRadio
                      ? (value) {}
                      : (value) {
                          setState(() {
                            selectRadio = true;
                            widget.orderStockTransfer.direction = "E";
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
                onChanged: (widget.orderStockTransfer.status == "A")
                    ? selectRadio
                        ? (value) {
                            setState(() {
                              selectRadio = false;
                              widget.orderStockTransfer.direction = "S";
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
