import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/header_items_checkpoint_widget.dart';
import 'package:flutter/material.dart';

class CustomHeaderCheckpoint extends StatelessWidget {
  const CustomHeaderCheckpoint({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: headeritemscheckpoint(),
          ),
          Expanded(
            flex: 3,
            child: headerfield('Total a Pagar'),
          ),
        ],
      ),
    );
  }
}
