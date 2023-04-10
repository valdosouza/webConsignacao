import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/content/content_order_stock_adjustment_desktop.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/content/content_order_stock_adjustment_register.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/content/content_order_stock_adjustment_register_edit_item.dart';
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
    bloc = Modular.get<OrderStockAdjustmentRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderStockAdjustmentRegisterModule>();
    });

    bloc.add(OrderGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderStockAdjustmentRegisterBloc,
        OrderStockAdjustmentRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        statesOrderStockAdjustment(state);
      },
      builder: (context, state) {
        if (state is OrderLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }

        if ((state is OrderGetLoadedState) ||
            (state is OrderReturnMasterState) ||
            (state is OrderNewLoadedState)) {
          return ContentOrderStockAdjustmentRegisterDesktop(
            tabIndex: bloc.tabIndex,
          );
        }

        if (state is ProductGetSucessState) {
          return const OrderStockAdjustmentRegisterProductsListWidget();
        }

        if (state is StocksLoadSuccessState) {
          return const OrderStockAdjustmentRegisterStocksListWidget();
        }

        if (state is EntitiesLoadSuccessState) {
          return const OrderStockAdjustmentRegisterEntitiesListWidget();
        }

        if ((state is OrderItemPageEditState) ||
            (state is ProductChosenSucessState)) {
          return const ContentOrderStockAdjustmentRegisterEditItem();
        }

        if (state is OrderItemUpdateSuccessState) {
          return ContentOrderStockAdjustmentRegisterDesktop(
            tabIndex: bloc.tabIndex,
          );
        }

        return _listaOrderStockAdjustments(bloc.orderStockAdjustments);
      },
    );
  }

  _listaOrderStockAdjustments(List<OrderStockAdjustmentListModel> list) {
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
              buildListView(bloc, list),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(OrderNewEvent());
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
