import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_filter_widget.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class OrderStockTransferList extends StatefulWidget {
  const OrderStockTransferList({
    Key? key,
    required this.orderStock,
    required this.bloc,
  }) : super(key: key);

  final List<OrderStockTransferRegisterOrderModel> orderStock;
  final OrderStockTransferRegisterBloc bloc;

  @override
  State<OrderStockTransferList> createState() => _OrderStockTransferListState();
}

class _OrderStockTransferListState extends State<OrderStockTransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Ordem de Transferência de Estoque"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              widget.bloc.add(
                OrderStockTransferNewRegisterEvent(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          FilterWidget(bloc: widget.bloc),
          SearchWidget(
            onChange: ((value) {
              widget.bloc.add(
                OrderStockTransferSearchEvent(
                  search: value,
                  // typeSearch: OrderStockTransferRegisterSearch.values[id],
                ),
              );
            }),
          ),
          const SizedBox(height: 30.0),
          Expanded(
            child: ListView.separated(
              itemCount: widget.orderStock.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  widget.bloc.add(
                    OrderStockTransferRegisterGetEvent(
                      id: widget.orderStock[index].order.id,
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text((index + 1).toString()),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        OrderStockTransferRegisterOrderModel.formatDate(
                            widget.orderStock[index].order.dtRecord.toString(),
                            'dd/MM/yyyy'),
                      ),
                      const SizedBox(height: 5.0),
                      Text(widget.orderStock[index].order.nameEntity),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      CustomToast.showToast(
                          "Funcionalidade em desenvolvimento.");
                    },
                  ),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
