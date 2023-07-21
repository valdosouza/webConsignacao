import 'package:appweb/app/modules/order_sale_register/presentation/widget/ordersale/header_field_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/ordersale/header_items_order_sale_widget.dart';
import 'package:flutter/material.dart';

class CustomHeaderOrderSale extends StatelessWidget {
  const CustomHeaderOrderSale({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: headeritemsordersale(),
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
