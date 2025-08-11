import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:flutter/material.dart';

const _kCellHeight = 40.0;
const _kCellPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 10);

Widget fielditemsorderLoadCard(
    OrderLoadCardItemsModel item,
    int position,
    bool enabled,
    int decimal,
    TextAlign textAlign,
    ) {
  String valueFor(OrderLoadCardItemsModel item, int position) {
    switch (position) {
      case 1:
        return item.nameProduct;
      case 2:
        final dayBalance = item.stockBalance + item.bonus + item.sale;
        return dayBalance.toStringAsFixed(0);
      case 3:
        return item.sale.toStringAsFixed(0);
      case 4:
        return item.bonus.toStringAsFixed(0);
      case 5:
        return (item.adjust > 0) ? item.adjust.toStringAsFixed(0) : "";
      case 6:
        return (item.newLoad > 0) ? item.newLoad.toStringAsFixed(0) : "";
      case 7:
        final currentBalance = (item.stockBalance + item.newLoad) - item.adjust;
        return currentBalance.toStringAsFixed(0);
      default:
        return "";
    }
  }

  final controller = TextEditingController(text: valueFor(item, position));

  return SizedBox(
    height: _kCellHeight, // mesma altura em todas as células
    child: TextFormField(
      controller: controller,
      readOnly: !enabled,
      maxLines: 1,
      textAlign: textAlign,                           // left p/ descrição; right p/ números se quiser
      textAlignVertical: TextAlignVertical.center,    // centraliza verticalmente
      strutStyle: const StrutStyle(                   // baseline consistente
        forceStrutHeight: true,
        height: 1.2,
        leading: 0,
      ),
      style: const TextStyle(fontSize: 14),
      keyboardType: (position == 1)
          ? TextInputType.text
          : TextInputType.number,
      decoration: const InputDecoration(
        isDense: true,
        contentPadding: _kCellPadding,                // padding igual p/ todas
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        // sem contador/erro visível p/ não alterar a altura
        counterText: '',
      ),
      onFieldSubmitted: (value) {
        if (value.isEmpty) value = "0";
        switch (position) {
          case 5:
            item.adjust = double.tryParse(value) ?? 0;
            break;
          case 6:
            item.newLoad = double.tryParse(value) ?? 0;
            break;
        }
      },
    ),
  );
}
