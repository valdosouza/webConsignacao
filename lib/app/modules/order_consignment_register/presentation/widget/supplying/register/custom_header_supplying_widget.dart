import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/register/header_items_supplying_widget.dart';
import 'package:flutter/material.dart';

class CustomHeaderSupplying extends StatelessWidget {
  final double headerHeight;
  const CustomHeaderSupplying({super.key, this.headerHeight = 50});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: headeritemssupplying(headerHeight: headerHeight),
          ),
          Expanded(
            flex: 3,
            child: headerfield(context, 'Observações', headerHeight),
          ),
        ],
      ),
    );
  }
}
