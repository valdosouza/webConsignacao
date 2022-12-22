import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/list_items_view_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/payment_info_widget.dart';
import 'package:flutter/material.dart';

class CustomBody extends StatefulWidget {
  final Size size;
  final OrderConsignmentCheckpointModel modelCheckpoint;
  const CustomBody(
      {super.key, required this.size, required this.modelCheckpoint});

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height - 127,
      width: widget.size.width,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: listitemsview(widget.modelCheckpoint.items, widget.size),
            ),
            Expanded(
              flex: 3,
              child: paymentinfo(widget.modelCheckpoint),
            ),
          ],
        ),
      ),
    );
  }
}
