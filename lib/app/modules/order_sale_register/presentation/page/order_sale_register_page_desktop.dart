import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_state.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/content/content_order_sale_desktop.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/content/content_order_sale_register.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/content/content_order_sale_register_edit_item.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/order_sale_register_list_entities.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/order_sale_register_list_products.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/order_sale_register_list_stocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderSaleRegisterPageDesktop extends StatefulWidget {
  const OrderSaleRegisterPageDesktop({super.key});

  @override
  State<OrderSaleRegisterPageDesktop> createState() =>
      OrderSaleRegisterPageDesktopState();
}

class OrderSaleRegisterPageDesktopState
    extends State<OrderSaleRegisterPageDesktop> {
  late final OrderSaleRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderSaleRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderSaleRegisterModule>();
    });

    bloc.add(OrderGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderSaleRegisterBloc, OrderSaleRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        statesOrderSale(state);
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
          return ContentOrderSaleRegisterDesktop(
            tabIndex: bloc.tabIndex,
          );
        }

        if (state is ProductGetSucessState) {
          return const OrderSaleRegisterProductsListWidget();
        }

        if (state is StocksLoadSuccessState) {
          return const OrderSaleRegisterStocksListWidget();
        }

        if (state is EntitiesLoadSuccessState) {
          return const OrderSaleRegisterEntitiesListWidget();
        }

        if ((state is OrderItemPageEditState) ||
            (state is ProductChosenSucessState)) {
          return const ContentOrderSaleRegisterEditItem();
        }

        if (state is OrderItemUpdateSuccessState) {
          return ContentOrderSaleRegisterDesktop(
            tabIndex: bloc.tabIndex,
          );
        }

        return _listaOrderSales(bloc.orderSales);
      },
    );
  }

  _listaOrderSales(List<OrderSaleListModel> list) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de Ordens de Transferência de estoque'),
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
