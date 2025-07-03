import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_bonus_register/order_bonus_register_module.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_bloc.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_event.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_state.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/content/content_order_bonus_desktop.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/content/content_order_bonus_register.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/widget/order_bonus_register_add_item.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/widget/order_bonus_register_list_entities.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/widget/order_bonus_register_list_products.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/widget/order_bonus_register_list_stocks.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderBonusRegisterPageDesktop extends StatefulWidget {
  const OrderBonusRegisterPageDesktop({super.key});

  @override
  State<OrderBonusRegisterPageDesktop> createState() =>
      OrderBonusRegisterPageDesktopState();
}

class OrderBonusRegisterPageDesktopState
    extends State<OrderBonusRegisterPageDesktop> {
  late final OrderBonusRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderBonusRegisterModule>();
    });
    bloc = Modular.get<OrderBonusRegisterBloc>();
    bloc.add(OrderBonusRegisterGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBonusRegisterBloc, OrderBonusRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        statesOrderBonuss(state);
      },
      builder: (context, state) {
        if (state is OrderBonusRegisterLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }

        if (state is OrderBonusRegisterInfoPageState) {
          return ContentOrderBonusRegisterDesktop(
            orderBonus: bloc.orderBonus,
            tabIndex: state.tabIndex,
          );
        }

        if (state is OrderBonusRegisterProductSuccessState) {
          return OrderBonusRegisterProductsListWidget(
            orderBonusItem: bloc.item,
          );
        }

        if (state is OrderBonusRegisterStockSuccessState) {
          return OrderBonusRegisterStocksListWidget(
            orderBonus: bloc.orderBonus,
          );
        }

        if (state is OrderBonusRegisterEntitySuccessState) {
          return OrderBonusRegisterEntitiesListWidget(
            orderBonus: bloc.orderBonus,
          );
        }

        if (state is OrderBonusRegisterItemPage) {
          return OrderBonusRegisterAddItem(
            bloc: bloc,
            item: state.item,
          );
        }

        final orderBonuss = state.list;
        return _listaOrderBonuss(orderBonuss);
      },
    );
  }

  Scaffold _listaOrderBonuss(List<OrderBonusRegisterModel> customers) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          'Lista de Ordens de Bonificação',
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
          bloc.orderBonus = OrderBonusRegisterModel.empty();
          bloc.stock = StockListModel.empty();
          bloc.edit = false;
          bloc.add(OrderBonusRegisterDesktopEvent());
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: kSecondaryColor),
      ),
    );
  }
}
