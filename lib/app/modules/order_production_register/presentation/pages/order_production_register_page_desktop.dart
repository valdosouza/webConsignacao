import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/order_production_register_module.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';
import 'package:appweb/app/modules/order_production_register/presentation/contents/content_order_production_desktop.dart';
import 'package:appweb/app/modules/order_production_register/presentation/contents/content_order_production_register.dart';
import 'package:appweb/app/modules/order_production_register/presentation/widgets/order_production_register_list_products.dart';
import 'package:appweb/app/modules/order_production_register/presentation/widgets/order_production_register_list_stocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderProductionRegisterPageDesktop extends StatefulWidget {
  const OrderProductionRegisterPageDesktop({super.key});

  @override
  State<OrderProductionRegisterPageDesktop> createState() =>
      OrderProductionRegisterPageDesktopState();
}

class OrderProductionRegisterPageDesktopState
    extends State<OrderProductionRegisterPageDesktop> {
  late final OrderProductionRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderProductionRegisterModule>();
    });
    bloc = Modular.get<OrderProductionRegisterBloc>();
    bloc.add(OrderProductionRegisterGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderProductionRegisterBloc,
        OrderProductionRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        statesOrderProductions(state);
      },
      builder: (context, state) {
        if (state is OrderProductionRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is OrderProductionRegisterInfoPageState) {
          return ContentOrderProductionRegisterDesktop(
            orderProduction: bloc.orderProduction,
          );
        }

        if (state is OrderProductionRegisterProductSuccessState) {
          return OrderProductionRegisterProductsListWidget(
            orderProduction: bloc.orderProduction,
          );
        }

        if (state is OrderProductionRegisterStockSuccessState) {
          return OrderProductionRegisterStocksListWidget(
            orderProduction: bloc.orderProduction,
          );
        }

        final orderProductions = state.list;
        return _listaOrderProductions(orderProductions);
      },
    );
  }

  _listaOrderProductions(List<OrderProductionRegisterModel> customers) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de Ordens de Produção'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              bloc.orderProduction = OrderProductionRegisterModel();
              bloc.edit = false;
              bloc.add(OrderProductionRegisterDesktopEvent());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildSearchInput(bloc),
              const SizedBox(height: 30.0),
              buildListView(bloc, customers),
            ],
          ),
        ),
      ),
    );
  }
}
