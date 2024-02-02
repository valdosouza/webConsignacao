import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_field_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/register/header_items_supplying_widget.dart';
import 'package:flutter/material.dart';

class CustomHeaderSupplying extends StatelessWidget {
  const CustomHeaderSupplying({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: headeritemssupplying(),
          ),
          Expanded(
            flex: 3,
            child: headerfield('Observações', 40),
          ),
        ],
      ),
    );
  }
}
