import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/Register/list_items_order_load_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBodyOrderLoadCardWidget extends StatefulWidget {
  final Size size;
  const CustomBodyOrderLoadCardWidget({
    super.key,
    required this.size,
  });

  @override
  State<CustomBodyOrderLoadCardWidget> createState() =>
      _CustomBodyOrderLoadCardWidgetState();
}

class _CustomBodyOrderLoadCardWidgetState
    extends State<CustomBodyOrderLoadCardWidget> {
  late final OrderLoadCardRegisterBloc bloc;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderLoadCardRegisterModule>;
    });

    bloc = Modular.get<OrderLoadCardRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height - 152,
      width: widget.size.width,
      child: listitemsorderLoadCard(bloc.modelLoadCard.items),
    );
  }
}
