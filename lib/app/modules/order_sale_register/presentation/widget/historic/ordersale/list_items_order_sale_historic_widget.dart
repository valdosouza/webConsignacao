import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/field_items_order_sale_widget.dart';
import 'package:flutter/material.dart';

class ListItemsOrderSaleHistoric extends StatefulWidget {
  final List<OrderSaleCardModel> items;
  final Size size;

  const ListItemsOrderSaleHistoric({
    super.key,
    required this.items,
    required this.size,
  });

  @override
  State<ListItemsOrderSaleHistoric> createState() =>
      _ListItemsOrderSaleHistoricState();
}

class _ListItemsOrderSaleHistoricState
    extends State<ListItemsOrderSaleHistoric> {
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _focusNodes =
        List.generate(widget.items.length * 4, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final base = index * 4;
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: FieldItemOrdersale(
                  item: widget.items[index],
                  position: 1,
                  enabled: false,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base],
                  listNode: _focusNodes,
                ),
              ),
              Expanded(
                flex: 4,
                child: FieldItemOrdersale(
                  item: widget.items[index],
                  position: 2,
                  enabled: false,
                  textAlign: TextAlign.left,
                  focus: _focusNodes[base + 1],
                  listNode: _focusNodes,
                ),
              ),
              Expanded(
                flex: 3,
                child: FieldItemOrdersale(
                  item: widget.items[index],
                  position: 3,
                  enabled: false,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base + 2],
                  listNode: _focusNodes,
                ),
              ),
              Expanded(
                flex: 3,
                child: FieldItemOrdersale(
                  item: widget.items[index],
                  position: 4,
                  enabled: false,
                  textAlign: TextAlign.right,
                  focus: _focusNodes[base + 3],
                  listNode: _focusNodes,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
