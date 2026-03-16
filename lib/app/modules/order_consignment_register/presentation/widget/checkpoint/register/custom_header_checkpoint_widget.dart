import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/header_items_checkpoint_widget.dart';
import 'package:flutter/material.dart';

class CustomHeaderCheckpoint extends StatelessWidget {
  final double headerHeight;
  const CustomHeaderCheckpoint({super.key, this.headerHeight = 50});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: headeritemscheckpoint(headerHeight: headerHeight),
          ),
          Expanded(
            flex: 3,
            child: headerfield(context, 'Total a Pagar', headerHeight),
          ),
        ],
      ),
    );
  }
}
