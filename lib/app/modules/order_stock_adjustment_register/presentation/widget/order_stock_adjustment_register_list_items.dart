// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockAdjustmentRegisterItemsListWidget extends StatefulWidget {
  final OrderStockAdjustmentRegisterModel orderStockAdjust;
  const OrderStockAdjustmentRegisterItemsListWidget({
    Key? key,
    required this.orderStockAdjust,
  }) : super(key: key);

  @override
  State<OrderStockAdjustmentRegisterItemsListWidget> createState() =>
      OrderStockAdjustmentRegisterItemsListWidgetState();
}

class OrderStockAdjustmentRegisterItemsListWidgetState
    extends State<OrderStockAdjustmentRegisterItemsListWidget> {
  late final OrderStockAdjustmentRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderStockAdjustmentRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderStockAdjustmentRegisterBloc,
        OrderStockAdjustmentRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        return _orderStockAdjustProductsList();
      },
    );
  }

  _orderStockAdjustProductsList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: widget.orderStockAdjust.items.isEmpty
          ? const Center(
              child: Text("Não encontramos nenhum registro em nossa base."))
          : ListView.separated(
              itemCount: widget.orderStockAdjust.items.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  if (bloc.orderStockAdjustment.status != "F") {
                    bloc.add(OrderStockAdjustmentRegisterItemEvent(
                        item: widget.orderStockAdjust.items[index]));
                  }
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: (Colors.black),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text((index + 1).toString()),
                    ),
                  ),
                  title: Text(widget.orderStockAdjust.items[index].description),
                  trailing: Text(
                      widget.orderStockAdjust.items[index].quantity.toString()),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
    );
  }
}
