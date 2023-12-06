import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/historic/ordersale/list_items_order_sale_historic_widget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/historic/payment/payment_info_historic_widget.dart';

import 'package:flutter/material.dart';

class CustomBodyOrderSaleHistoricWidget extends StatefulWidget {
  final Size size;
  final OrderSaleMainCardModel modelOrdersale;
  const CustomBodyOrderSaleHistoricWidget({
    super.key,
    required this.size,
    required this.modelOrdersale,
  });

  @override
  State<CustomBodyOrderSaleHistoricWidget> createState() =>
      _CustomBodyOrderSaleHistoricWidgetState();
}

class _CustomBodyOrderSaleHistoricWidgetState
    extends State<CustomBodyOrderSaleHistoricWidget> {
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
              child: listitemsordersaleHistoric(
                  widget.modelOrdersale.items, widget.size, context),
            ),
            Expanded(
              flex: 3,
              child: paymentinfoHistoric(widget.modelOrdersale),
            ),
          ],
        ),
      ),
    );
  }
}
