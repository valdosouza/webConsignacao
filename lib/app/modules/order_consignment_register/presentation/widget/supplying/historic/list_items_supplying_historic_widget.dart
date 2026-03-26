import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/register/field_items_supplying_widget.dart';
import 'package:flutter/material.dart';

class ListItemsSupplyingHistoric extends StatefulWidget {
  final List<OrderConsignmentSupplyingCardModel> items;
  final Size size;

  const ListItemsSupplyingHistoric({
    super.key,
    required this.items,
    required this.size,
  });

  @override
  State<ListItemsSupplyingHistoric> createState() =>
      _ListItemsSupplyingHistoricState();
}

class _ListItemsSupplyingHistoricState
    extends State<ListItemsSupplyingHistoric> {
  late List<FocusNode> _focusNodes;

  static const int _cols = 6;

  @override
  void initState() {
    super.initState();
    _focusNodes =
        List.generate(widget.items.length * _cols, (_) => FocusNode());
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
        final base = index * _cols;
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Expanded(
                flex: 190,
                child: FieldItemSupplying(
                  item: widget.items[index],
                  position: 1,
                  enabled: false,
                  decimal: 0,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base],
                ),
              ),
              Expanded(
                flex: 380,
                child: FieldItemSupplying(
                  item: widget.items[index],
                  position: 2,
                  enabled: false,
                  decimal: 0,
                  textAlign: TextAlign.left,
                  focus: _focusNodes[base + 1],
                ),
              ),
              Expanded(
                flex: 190,
                child: FieldItemSupplying(
                  item: widget.items[index],
                  position: 3,
                  enabled: false,
                  decimal: 0,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base + 2],
                ),
              ),
              Expanded(
                flex: 240,
                child: FieldItemSupplying(
                  item: widget.items[index],
                  position: 4,
                  enabled: false,
                  decimal: 0,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base + 3],
                ),
              ),
              Expanded(
                flex: 315,
                child: FieldItemSupplying(
                  item: widget.items[index],
                  position: 5,
                  enabled: false,
                  decimal: 2,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base + 4],
                ),
              ),
              Expanded(
                flex: 270,
                child: FieldItemSupplying(
                  item: widget.items[index],
                  position: 6,
                  enabled: false,
                  decimal: 2,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base + 5],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
