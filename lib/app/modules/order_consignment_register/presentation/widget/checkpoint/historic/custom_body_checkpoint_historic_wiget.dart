import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/historic/list_items_checkpoint_historic_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/historic/payment_info_historic_widget.dart';
import 'package:flutter/material.dart';

class CustomBodyCheckpointHistoricWidget extends StatefulWidget {
  final Size size;
  final OrderConsignmentCheckpointModel modelCheckpoint;
  const CustomBodyCheckpointHistoricWidget(
      {super.key, required this.size, required this.modelCheckpoint});

  @override
  State<CustomBodyCheckpointHistoricWidget> createState() =>
      _CustomBodyCheckpointHistoricWidgetState();
}

class _CustomBodyCheckpointHistoricWidgetState
    extends State<CustomBodyCheckpointHistoricWidget> {
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
              child: listitemscheckpointhistoric(
                  widget.modelCheckpoint.items, widget.size),
            ),
            Expanded(
              flex: 3,
              child: paymentinfohistoric(widget.modelCheckpoint),
            ),
          ],
        ),
      ),
    );
  }
}
