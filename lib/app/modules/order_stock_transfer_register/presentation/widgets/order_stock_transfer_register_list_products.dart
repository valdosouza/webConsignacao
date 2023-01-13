import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_event.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';

class OrderStockTransferRegisterProductsListWidget extends StatefulWidget {
  const OrderStockTransferRegisterProductsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderStockTransferRegisterProductsListWidget> createState() =>
      OrderStockTransferRegisterProductsListWidgetState();
}

class OrderStockTransferRegisterProductsListWidgetState
    extends State<OrderStockTransferRegisterProductsListWidget> {
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
        if (state is ProductGetSucessState) {
          return _orderStockTransferItemProductsList(bloc);
        } else {
          return Container();
        }
      },
    );
  }

  _orderStockTransferItemProductsList(OrderStockTransferRegisterBloc bloc) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de produtos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            bloc.tabIndex = 1;
            bloc.add(OrderReturnMasterEvent());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: kBoxDecorationStyle,
              child: TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                onChanged: (value) {
                  bloc.search = value;
                  bloc.add(ProductsSearchEvent());
                },
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 4.0),
                  hintText: "Pesquise aqui",
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: bloc.products.isEmpty
                  ? const Center(
                      child:
                          Text("Não encontramos nenhum produto em nossa base."))
                  : ListView.separated(
                      itemCount: bloc.products.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          bloc.orderItem.tbProductId = bloc.products[index].id;
                          bloc.orderItem.nameProduct =
                              bloc.products[index].description;
                          bloc.add(ProductChosenEvent());
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Text(bloc.products[index].id.toString()),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bloc.products[index].description),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (_, __) => const Divider(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
