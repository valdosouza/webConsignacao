import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/payment/payment_info_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/list_items_order_sale_widget.dart';
import 'package:flutter/material.dart';

class CustomBodyOrderSale extends StatefulWidget {
  final Size size;
  final OrderSaleMainCardModel modelOrdersale;
  const CustomBodyOrderSale(
      {super.key, required this.size, required this.modelOrdersale});

  @override
  State<CustomBodyOrderSale> createState() => _CustomBodyOrderSaleState();
}

class _CustomBodyOrderSaleState extends State<CustomBodyOrderSale> {
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
              child: listitemsordersale(
                  widget.modelOrdersale.items, widget.size, context),
            ),
            Expanded(
              flex: 3,
              child: paymentinfo(widget.modelOrdersale),
            ),
          ],
        ),
      ),
    );
  }
}
