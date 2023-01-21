import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/content/content_order_stock_adjustment_desktop.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/content/content_order_stock_adjustment_register.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widget/order_stock_adjustment_register_add_item.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widget/order_stock_adjustment_register_list_entities.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widget/order_stock_adjustment_register_list_products.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widget/order_stock_adjustment_register_list_stocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockAdjustmentRegisterPageDesktop extends StatefulWidget {
  const OrderStockAdjustmentRegisterPageDesktop({super.key});

  @override
  State<OrderStockAdjustmentRegisterPageDesktop> createState() =>
      OrderStockAdjustmentRegisterPageDesktopState();
}

class OrderStockAdjustmentRegisterPageDesktopState
    extends State<OrderStockAdjustmentRegisterPageDesktop> {
  late final OrderStockAdjustmentRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderStockAdjustmentRegisterModule>();
    });
    bloc = Modular.get<OrderStockAdjustmentRegisterBloc>();
    bloc.add(OrderStockAdjustmentRegisterGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderStockAdjustmentRegisterBloc,
        OrderStockAdjustmentRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        statesOrderStockAdjustments(state);
      },
      builder: (context, state) {
        if (state is OrderStockAdjustmentRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is OrderStockAdjustmentRegisterInfoPageState) {
          return ContentOrderStockAdjustmentRegisterDesktop(
            orderStockAdjustment: bloc.orderStockAdjustment,
            tabIndex: state.tabIndex,
          );
        }

        if (state is OrderStockAdjustmentRegisterProductSuccessState) {
          return OrderStockAdjustmentRegisterProductsListWidget(
            orderStockAdjustmentItem: bloc.item,
          );
        }

        if (state is OrderStockAdjustmentRegisterStockSuccessState) {
          return OrderStockAdjustmentRegisterStocksListWidget(
            orderStockAdjustment: bloc.orderStockAdjustment,
          );
        }

        if (state is OrderStockAdjustmentRegisterEntitySuccessState) {
          return OrderStockAdjustmentRegisterEntitiesListWidget(
            orderStockAdjustment: bloc.orderStockAdjustment,
          );
        }

        if (state is OrderStockAdjustmentRegisterItemPage) {
          return OrderStockAdjustmentRegisterAddItem(
            bloc: bloc,
            item: state.item,
          );
        }

        final orderStockAdjustments = state.list;
        return _listaOrderStockAdjustments(orderStockAdjustments);
      },
    );
  }

  _listaOrderStockAdjustments(
      List<OrderStockAdjustmentRegisterModel> customers) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de Ordens de Ajuste de estoque'),
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
          bloc.orderStockAdjustment = OrderStockAdjustmentRegisterModel.empty();
          bloc.stock = StockListModel.empty();
          bloc.edit = false;
          bloc.add(OrderStockAdjustmentRegisterDesktopEvent());
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
