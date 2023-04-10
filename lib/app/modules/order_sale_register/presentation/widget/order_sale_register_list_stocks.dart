import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';

class OrderSaleRegisterStocksListWidget extends StatefulWidget {
  const OrderSaleRegisterStocksListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderSaleRegisterStocksListWidget> createState() =>
      OrderSaleRegisterStocksListWidgetState();
}

class OrderSaleRegisterStocksListWidgetState
    extends State<OrderSaleRegisterStocksListWidget> {
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
        if (state is StocksLoadSuccessState) {
          return _orderSaleStocksList(state);
        } else {
          return Container();
        }
      },
    );
  }

  _orderSaleStocksList(StocksLoadSuccessState state) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de estoques'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            bloc.tabIndex = 0;
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
                  bloc.add(StockSearchEvent(type: ""));
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
              child: bloc.stocks.isEmpty
                  ? const Center(
                      child: Text(
                          "Não encontramos nenhum registro em nossa base."))
                  : ListView.separated(
                      itemCount: bloc.stocks.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          bloc.orderMain.order.tbStockListId =
                              bloc.stocks[index].id;
                          bloc.orderMain.order.nameStockList =
                              bloc.stocks[index].description;
                          bloc.tabIndex = 0;
                          bloc.add(OrderReturnMasterEvent());
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: (Colors.black),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Text(bloc.stocks[index].id.toString()),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bloc.stocks[index].description),
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
