// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockAdjustmentRegisterItemsListWidget extends StatefulWidget {
  final OrderStockAdjustmentRegisterModel orderStockTransfer;
  const OrderStockAdjustmentRegisterItemsListWidget({
    Key? key,
    required this.orderStockTransfer,
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
        return _orderStockTransferProductsList();
      },
    );
  }

  _orderStockTransferProductsList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: widget.orderStockTransfer.items.isEmpty
          ? const Center(
              child: Text("Não encontramos nenhum registro em nossa base."))
          : ListView.separated(
              itemCount: widget.orderStockTransfer.items.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  if (bloc.orderStockAdjustment.status == "A") {
                    bloc.add(OrderStockAdjustmentRegisterItemEvent(
                        item: widget.orderStockTransfer.items[index]));
                  }
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text((index + 1).toString()),
                    ),
                  ),
                  title:
                      Text(widget.orderStockTransfer.items[index].description),
                  trailing: Text(widget.orderStockTransfer.items[index].quantity
                      .toString()),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
    );
  }
}
