import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/field_items_checkpoint_widget.dart';
import 'package:flutter/material.dart';

class ListItemsCheckpoint extends StatefulWidget {
  final List<OrderConsignmentCheckpointCardModel> items;
  final Size size;

  const ListItemsCheckpoint({
    super.key,
    required this.items,
    required this.size,
  });

  @override
  State<ListItemsCheckpoint> createState() => _ListItemsCheckpointState();
}

class _ListItemsCheckpointState extends State<ListItemsCheckpoint> {
  late List<FocusNode> _focusNodes;

  // 6 colunas por linha: bonus, nome, qtty, restante, venda, subtotal
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
                flex: 200,
                child: FieldItemCheckpoint(
                  item: widget.items[index],
                  position: 1,
                  enabled: false,
                  decimal: 0,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base],
                ),
              ),
              Expanded(
                flex: 400,
                child: FieldItemCheckpoint(
                  item: widget.items[index],
                  position: 2,
                  enabled: false,
                  decimal: 0,
                  textAlign: TextAlign.left,
                  focus: _focusNodes[base + 1],
                ),
              ),
              Expanded(
                flex: 270,
                child: FieldItemCheckpoint(
                  item: widget.items[index],
                  position: 3,
                  enabled: false,
                  decimal: 0,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base + 2],
                ),
              ),
              Expanded(
                flex: 200,
                child: FieldItemCheckpoint(
                  item: widget.items[index],
                  position: 4,
                  enabled: true,
                  decimal: 0,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base + 3],
                ),
              ),
              Expanded(
                flex: 315,
                child: FieldItemCheckpoint(
                  item: widget.items[index],
                  position: 5,
                  enabled: false,
                  decimal: 2,
                  textAlign: TextAlign.center,
                  focus: _focusNodes[base + 4],
                ),
              ),
              Expanded(
                flex: 300,
                child: FieldItemCheckpoint(
                  item: widget.items[index],
                  position: 6,
                  enabled: false,
                  decimal: 2,
                  textAlign: TextAlign.right,
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
