// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';

class OrderStockAdjustmentRegisterProductsListWidget extends StatefulWidget {
  final OrderStockAdjustmentRegisterModel orderStockAdjustment;
  const OrderStockAdjustmentRegisterProductsListWidget({
    Key? key,
    required this.orderStockAdjustment,
  }) : super(key: key);

  @override
  State<OrderStockAdjustmentRegisterProductsListWidget> createState() =>
      OrderStockAdjustmentRegisterProductsListWidgetState();
}

class OrderStockAdjustmentRegisterProductsListWidgetState
    extends State<OrderStockAdjustmentRegisterProductsListWidget> {
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
        if (state is OrderStockAdjustmentRegisterProductSuccessState) {
          return _orderStockAdjustmentProductsList(state);
        } else {
          return Container();
        }
      },
    );
  }

  _orderStockAdjustmentProductsList(
      OrderStockAdjustmentRegisterProductSuccessState state) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de produtos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            bloc.add(OrderStockAdjustmentRegisterReturnEvent());
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
                  bloc.add(OrderStockAdjustmentRegisterSearchProductsEvent(
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
              child: state.products.isEmpty
                  ? const Center(
                      child: Text(
                          "Não encontramos nenhum produto em nossa base."))
                  : ListView.separated(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          // widget.orderStockAdjustment =
                          //     state.products[index].id;
                          // widget.orderStockAdjustment.nameMerchandise =
                          //     state.products[index].description;
                          bloc.add(OrderStockAdjustmentRegisterReturnEvent());
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child:
                                  Text(state.products[index].id.toString()),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.products[index].description),
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
