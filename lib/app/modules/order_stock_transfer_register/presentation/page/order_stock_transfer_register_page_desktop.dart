import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_event.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_state.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/content/content_order_stock_transfer_desktop.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/content/content_order_stock_transfer_register.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/content/content_order_stock_transfer_register_edit_item.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widget/order_stock_transfer_register_list_entities.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widget/order_stock_transfer_register_list_products.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widget/order_stock_transfer_register_list_stocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockTransferRegisterPageDesktop extends StatefulWidget {
  const OrderStockTransferRegisterPageDesktop({super.key});

  @override
  State<OrderStockTransferRegisterPageDesktop> createState() =>
      OrderStockTransferRegisterPageDesktopState();
}

class OrderStockTransferRegisterPageDesktopState
    extends State<OrderStockTransferRegisterPageDesktop> {
  late final OrderStockTransferRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderStockTransferRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderStockTransferRegisterModule>();
    });

    bloc.add(OrderGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderStockTransferRegisterBloc,
        OrderStockTransferRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        statesOrderStockTransfer(state);
      },
      builder: (context, state) {
        if (state is OrderLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if ((state is OrderGetLoadedState) ||
            (state is OrderReturnMasterState)) {
          return ContentOrderStockTransferRegisterDesktop(
            tabIndex: bloc.tabIndex,
          );
        }

        if (state is ProductGetSucessState) {
          return const OrderStockTransferRegisterProductsListWidget();
        }

        if (state is StocksLoadSuccessState) {
          return const OrderStockTransferRegisterStocksListWidget();
        }

        if (state is EntitiesLoadSuccessState) {
          return const OrderStockTransferRegisterEntitiesListWidget();
        }

        if ((state is OrderItemPageEditState) ||
            (state is ProductChosenSucessState)) {
          return const ContentOrderStockTransferRegisterEditItem();
        }

        if (state is OrderItemUpdateSuccessState) {
          return ContentOrderStockTransferRegisterDesktop(
            tabIndex: bloc.tabIndex,
          );
        }

        return _listaOrderStockTransfers(bloc.orderStockTransfers);
      },
    );
  }

  _listaOrderStockTransfers(List<OrderStockTransferListModel> list) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de Ordens de Transferência de estoque'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              bloc.add(OrderNewEvent());
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
              buildListView(bloc, list),
            ],
          ),
        ),
      ),
    );
  }
}
