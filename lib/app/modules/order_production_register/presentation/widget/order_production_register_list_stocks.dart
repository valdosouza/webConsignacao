// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';

class OrderProductionRegisterStocksListWidget extends StatefulWidget {
  final OrderProductionRegisterModel orderProduction;
  const OrderProductionRegisterStocksListWidget({
    Key? key,
    required this.orderProduction,
  }) : super(key: key);

  @override
  State<OrderProductionRegisterStocksListWidget> createState() =>
      OrderProductionRegisterStocksListWidgetState();
}

class OrderProductionRegisterStocksListWidgetState
    extends State<OrderProductionRegisterStocksListWidget> {
  late final OrderProductionRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderProductionRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderProductionRegisterBloc,
        OrderProductionRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is OrderProductionRegisterStockSuccessState) {
          return _orderProductionStocksList(state);
        } else {
          return Container();
        }
      },
    );
  }

  _orderProductionStocksList(OrderProductionRegisterStockSuccessState state) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de estoques'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            bloc.add(OrderProductionRegisterReturnEvent());
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
                  bloc.add(OrderProductionRegisterSearchStocksEvent(
                      search: value));
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
              child: state.stock.isEmpty
                  ? const Center(
                      child: Text(
                          "Não encontramos nenhum estoque em nossa base."))
                  : ListView.separated(
                      itemCount: state.stock.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          widget.orderProduction.tbStockListIdDes =
                              state.stock[index].id;
                          widget.orderProduction.nameStockListDes =
                              state.stock[index].description;
                          bloc.add(OrderProductionRegisterReturnEvent());
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Text(state.stock[index].id.toString()),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.stock[index].description),
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
