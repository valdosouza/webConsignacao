// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:flutter/material.dart';

class OrderStockAdjustmentRegisterDirectionWidget extends StatefulWidget {
  final OrderStockAdjustmentRegisterModel orderStockAdjustment;
  const OrderStockAdjustmentRegisterDirectionWidget({
    Key? key,
    required this.orderStockAdjustment,
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
    // TODO: implement initState
    super.initState();
    selectRadio = widget.orderStockAdjustment.direction == 'E' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    active = widget.orderStockAdjustment.direction == 'E' ? true : false;
    return Row(
      children: [
        Row(
          children: [
            Radio(
              value: true,
              groupValue: selectRadio,
              activeColor: Colors.red,
              onChanged: selectRadio
                  ? (value) {}
                  : (value) {
                      setState(() {
                        selectRadio = true;
                        widget.orderStockAdjustment.direction = "E";
                      });
                    },
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
                onChanged: selectRadio
                    ? (value) {
                        setState(() {
                          selectRadio = false;
                          widget.orderStockAdjustment.direction = "S";
                        });
                      }
                    : (value) {}),
            const SizedBox(width: 5.0),
            const Text("Saída", style: kLabelStyle),
          ],
        ),
      ],
    );
  }
}
