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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: bloc.orderMain.items.isEmpty
          ? const Center(
              child: Text("Não encontramos nenhum produto em nossa base."))
          : ListView.separated(
              itemCount: bloc.orderMain.items.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  bloc.orderItem = bloc.orderMain.items[index];
                  bloc.add(OrderItemEditEvent());
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text((index + 1).toString()),
                    ),
                  ),
                  title: Text(bloc.orderMain.items[index].nameProduct),
                  trailing:
                      Text(bloc.orderMain.items[index].quantity.toString()),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
    );
  }
}
