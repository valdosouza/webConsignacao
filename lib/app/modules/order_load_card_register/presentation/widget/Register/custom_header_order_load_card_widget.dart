import 'package:appweb/app/modules/order_load_card_register/presentation/widget/Register/header_items_order_load_card_widget.dart';
import 'package:flutter/material.dart';

class CustomHeaderOrderLoadCard extends StatelessWidget {
  const CustomHeaderOrderLoadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: headeritemsorderLoadCard(),
          ),
        ],
      ),
    );
  }
}
