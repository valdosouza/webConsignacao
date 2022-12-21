import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/list_items_view_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/payment_info_widget.dart';
import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  final Size size;
  final OrderConsignmentCheckpointModel modelCheckpoint;
  const CustomBody(
      {super.key, required this.size, required this.modelCheckpoint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height - 127,
      width: size.width,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: listitemsview(modelCheckpoint.items, size),
            ),
            Expanded(
              flex: 3,
              child: paymentinfo(modelCheckpoint),
            ),
          ],
        ),
      ),
    );
  }
}
