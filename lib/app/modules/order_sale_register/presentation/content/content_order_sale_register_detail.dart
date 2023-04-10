import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_register_items_model.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderSaleRegisterDetail extends StatefulWidget {
  const ContentOrderSaleRegisterDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentOrderSaleRegisterDetail> createState() =>
      ContentOrderSaleRegisterDetailState();
}

class ContentOrderSaleRegisterDetailState
    extends State<ContentOrderSaleRegisterDetail> {
  late final OrderSaleRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderSaleRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderSaleRegisterModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSaleRegisterBloc, OrderSaleRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        return _orderSaleProductsList();
      },
    );
  }

  _orderSaleProductsList() {
    List<OrderSaleRegisterItemsModel> orderItemsFiltered =
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
