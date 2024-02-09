import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/historic/list_items_order_load_card_historic_widget.dart';

class CustomBodyOrderLoadCardHistoricWidget extends StatefulWidget {
  final OrderLoadCardMainModel orderLoadCard;
  final Size size;
  const CustomBodyOrderLoadCardHistoricWidget({
    super.key,
    required this.orderLoadCard,
    required this.size,
  });

  @override
  State<CustomBodyOrderLoadCardHistoricWidget> createState() =>
      _CustomBodyOrderLoadCardHistoricWidgetState();
}

class _CustomBodyOrderLoadCardHistoricWidgetState
    extends State<CustomBodyOrderLoadCardHistoricWidget> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderLoadCardRegisterModule>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height - 152,
      width: widget.size.width,
      child: listitemsorderLoadCardHistoric(widget.orderLoadCard.items),
    );
  }
}
