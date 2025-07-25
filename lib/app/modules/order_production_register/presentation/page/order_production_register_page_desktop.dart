import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/order_production_register_module.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';
import 'package:appweb/app/modules/order_production_register/presentation/content/content_order_production_desktop.dart';
import 'package:appweb/app/modules/order_production_register/presentation/content/content_order_production_register.dart';
import 'package:appweb/app/modules/order_production_register/presentation/widget/order_production_register_list_products.dart';
import 'package:appweb/app/modules/order_production_register/presentation/widget/order_production_register_list_stocks.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    bloc.add(OrderGetListEvent());
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
        if (state is OrderLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }

        if (state is OrderInfoPageState) {
          return const ContentOrderProductionRegisterDesktop();
        }

        if (state is OrderGetProductSucessState) {
          return OrderProductionRegisterProductsListWidget(
            orderProduction: bloc.orderProduction,
          );
        }

        if (state is OrderGetStockSucessState) {
          return OrderProductionRegisterStocksListWidget(
            orderProduction: bloc.orderProduction,
          );
        }

        return _listaOrderProductions(bloc.orderProductions);
      },
    );
  }

  Scaffold _listaOrderProductions(
      List<OrderProductionRegisterModel> customers) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          'Lista de Ordens de Produção',
          style: kTitleAppBarStyle,
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.orderProduction = OrderProductionRegisterModel.isEmpty();
          bloc.add(OrderAddEvent());
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: kSecondaryColor),
      ),
    );
  }
}
