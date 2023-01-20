import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_event.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderStockTransferRegisterDetail extends StatefulWidget {
  const ContentOrderStockTransferRegisterDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentOrderStockTransferRegisterDetail> createState() =>
      ContentOrderStockTransferRegisterDetailState();
}

class ContentOrderStockTransferRegisterDetailState
    extends State<ContentOrderStockTransferRegisterDetail> {
  late final OrderStockTransferRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderStockTransferRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderStockTransferRegisterModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderStockTransferRegisterBloc,
        OrderStockTransferRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        return _orderStockTransferProductsList();
      },
    );
  }

  _orderStockTransferProductsList() {
    List<OrderStockTransferRegisterItemsModel> orderItemsFiltered =
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
                  bloc.orderItem = orderItemsFiltered[index];
                  bloc.add(OrderItemEditEvent());
                },
                child: ListTile(
                  leading: CircleAvatar(
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
                      bloc.orderItem = orderItemsFiltered[index];
                      bloc.add(OrderItemDeleteEvent());
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
