import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/event.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/state.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/content/mobile/content_order_main.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/content/mobile/content_order_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/content/mobile/content_products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageMobile extends StatefulWidget {
  const PageMobile({super.key});

  @override
  State<PageMobile> createState() => PageMobileState();
}

class PageMobileState extends State<PageMobile> {
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
            child: CustomCircularProgressIndicator(),
          );
        }

        if ((state is OrderGetLoadedState) ||
            (state is OrderReturnMasterState) ||
            (state is OrderNewLoadedState)) {
          return ContentOrderMain(
            tabIndex: bloc.tabIndex,
          );
        }
        if ((state is ProductGetSucessState) ||
            (state is ProductSearchSucessState)) {
          return const ContentProductList();
        }

        if (state is OrderItemUpdateSuccessState) {
          return ContentOrderMain(
            tabIndex: bloc.tabIndex,
          );
        }

        return const ContentOrderList();
      },
    );
  }
}
