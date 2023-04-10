import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderStockAdjustmentRegisterDetail extends StatefulWidget {
  const ContentOrderStockAdjustmentRegisterDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentOrderStockAdjustmentRegisterDetail> createState() =>
      ContentOrderStockAdjustmentRegisterDetailState();
}

class ContentOrderStockAdjustmentRegisterDetailState
    extends State<ContentOrderStockAdjustmentRegisterDetail> {
  late final OrderStockAdjustmentRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderStockAdjustmentRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderStockAdjustmentRegisterModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderStockAdjustmentRegisterBloc,
        OrderStockAdjustmentRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        return _orderStockAdjustmentProductsList();
      },
    );
  }

  _orderStockAdjustmentProductsList() {
    List<OrderStockAdjustmentRegisterItemsModel> orderItemsFiltered =
        bloc.orderMain.items.where((i) => i.updateStatus != "D").toList();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: orderItemsFiltered.isEmpty
          ? const Center(
              child: Text("Não encontramos nenhum registro em nossa base."))
          : ListView.separated(
              itemCount: orderItemsFiltered.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  if (bloc.orderMain.order.status != "F") {
                    bloc.orderItem = orderItemsFiltered[index];
                    bloc.add(OrderItemEditEvent());
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
                  title: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(orderItemsFiltered[index].nameProduct),
                      ),
                      Expanded(
                        flex: 1,
                        child:
                            Text(orderItemsFiltered[index].quantity.toString()),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      if (bloc.orderMain.order.status != "F") {
                        bloc.orderItem = orderItemsFiltered[index];
                        bloc.add(OrderItemDeleteEvent());
                      }
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
    );
  }
}
