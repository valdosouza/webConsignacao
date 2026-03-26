import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/register/extra_info_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/register/list_items_supplying_widget.dart';
import 'package:flutter/material.dart';

class CustomBodySupplying extends StatefulWidget {
  final Size size;
  final OrderConsignmentSupplyingModel modelSupplying;
  const CustomBodySupplying(
      {super.key, required this.size, required this.modelSupplying});

  @override
  State<CustomBodySupplying> createState() => _CustomBodySupplyingState();
}

class _CustomBodySupplyingState extends State<CustomBodySupplying> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 9,
          child: ListItemsSupplying(
            items: widget.modelSupplying.items,
            size: widget.size,
          ),
        ),
        Expanded(
          flex: 3,
          child:
              ExtraInfo(modelSupplying: widget.modelSupplying, size: widget.size),
        ),
      ],
    );
  }
}
