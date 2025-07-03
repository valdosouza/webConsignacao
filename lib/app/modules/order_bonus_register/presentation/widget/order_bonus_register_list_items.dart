// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_bloc.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_event.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderBonusRegisterItemsListWidget extends StatefulWidget {
  final OrderBonusRegisterModel orderBonus;
  const OrderBonusRegisterItemsListWidget({
    super.key,
    required this.orderBonus,
  });

  @override
  State<OrderBonusRegisterItemsListWidget> createState() =>
      OrderBonusRegisterItemsListWidgetState();
}

class OrderBonusRegisterItemsListWidgetState
    extends State<OrderBonusRegisterItemsListWidget> {
  late final OrderBonusRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderBonusRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBonusRegisterBloc, OrderBonusRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        return _orderBonusProductsList();
      },
    );
  }

  Padding _orderBonusProductsList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: widget.orderBonus.items.isEmpty
          ? const Center(
              child: Text("Não encontramos nenhum registro em nossa base."))
          : ListView.separated(
              itemCount: widget.orderBonus.items.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  if (bloc.orderBonus.status != "F") {
                    bloc.add(OrderBonusRegisterItemEvent(
                        item: widget.orderBonus.items[index]));
                  }
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: (Colors.black),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text(
                        (index + 1).toString(),
                        style: kCircleAvatarTextStyle,
                      ),
                    ),
                  ),
                  title: AutoSizeText(
                    widget.orderBonus.items[index].description,
                    style: kTitleAppBarStyle,
                  ),
                  trailing:
                      Text(widget.orderBonus.items[index].quantity.toString()),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
    );
  }
}
