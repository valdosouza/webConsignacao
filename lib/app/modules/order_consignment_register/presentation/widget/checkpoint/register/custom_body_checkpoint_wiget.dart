import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/list_items_checkpoint_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/payment_info_widget.dart';
import 'package:flutter/material.dart';

class CustomBodyCheckpoint extends StatefulWidget {
  final Size size;
  final OrderConsignmentCheckpointModel modelCheckpoint;
  const CustomBodyCheckpoint(
      {super.key, required this.size, required this.modelCheckpoint});

  @override
  State<CustomBodyCheckpoint> createState() => _CustomBodyCheckpointState();
}

class _CustomBodyCheckpointState extends State<CustomBodyCheckpoint> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 9,
          child: ListItemsCheckpoint(
            items: widget.modelCheckpoint.items,
            size: widget.size,
          ),
        ),
        Expanded(
          flex: 3,
          child: paymentinfo(widget.modelCheckpoint),
        ),
      ],
    );
  }
}
