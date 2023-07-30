import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/historic/extra_info_historic_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/historic/list_items_supplying_historic_widget.dart';
import 'package:flutter/material.dart';

class CustomBodySupplyingHistoricWidget extends StatefulWidget {
  final Size size;
  final OrderConsignmentSupplyingModel modelSupplying;
  const CustomBodySupplyingHistoricWidget(
      {super.key, required this.size, required this.modelSupplying});

  @override
  State<CustomBodySupplyingHistoricWidget> createState() =>
      _CustomBodySupplyingHistoricWidgetState();
}

class _CustomBodySupplyingHistoricWidgetState
    extends State<CustomBodySupplyingHistoricWidget> {
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
              child: listitemssupplyinghistoric(
                  widget.modelSupplying.items, widget.size),
            ),
            Expanded(
              flex: 3,
              child: ExtraInfoHistoric(
                  modelSupplying: widget.modelSupplying, size: widget.size),
            ),
          ],
        ),
      ),
    );
  }
}
