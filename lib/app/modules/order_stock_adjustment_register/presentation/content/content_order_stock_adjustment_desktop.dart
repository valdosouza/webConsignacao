import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/content/content_stock_adjustment_register_master.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/content/content_order_stock_adjustment_register_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

class ContentOrderStockAdjustmentRegisterDesktop extends StatefulWidget {
  final int tabIndex;
  const ContentOrderStockAdjustmentRegisterDesktop(
      {Key? key, this.tabIndex = 0})
      : super(key: key);

  @override
  State<ContentOrderStockAdjustmentRegisterDesktop> createState() =>
      _ContentOrderStockAdjustmentRegisterDesktopState();
}

class _ContentOrderStockAdjustmentRegisterDesktopState
    extends State<ContentOrderStockAdjustmentRegisterDesktop>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late final OrderStockAdjustmentRegisterBloc bloc;
  late MaskedTextController controllerDate;

  @override
  void initState() {
    bloc = Modular.get<OrderStockAdjustmentRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderStockAdjustmentRegisterModule>();
    });

    _tabController = TabController(vsync: this, length: 2);
    _tabController.animateTo(widget.tabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(OrderGetListEvent());
        return true;
      },
      child: BlocConsumer<OrderStockAdjustmentRegisterBloc,
          OrderStockAdjustmentRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is StocksLoadErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
          if (state is ProductGetErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(OrderGetListEvent());
                },
              ),
              title: Text(
                bloc.orderMain.order.id > 0
                    ? "Editar Ordem de Ajuste de Estoque"
                    : "Adicionar Ordem de Ajuste de Estoque",
                style: kHintTextStyle.copyWith(fontSize: 20.0),
              ),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    (bloc.orderMain.order.status != "F")
                        ? PopupMenuItem(
                            onTap: (() => bloc.add(OrderClosureEvent())),
                            value: 0,
                            child: const Text("Encerrar"),
                          )
                        : PopupMenuItem(
                            onTap: (() => bloc.add(OrderReopenEvent())),
                            value: 0,
                            child: const Text("Reabrir"),
                          ),
                  ],
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorWeight: 2.0,
                indicatorColor: Colors.black,
                tabs: [
                  const Tab(text: 'Dados do Ajuste'),
                  Tab(
                    child: ListTile(
                      title: const Center(
                          child: Text(
                        'Itens para Ajustar',
                        style: TextStyle(color: Colors.white),
                      )),
                      trailing: IconButton(
                        onPressed: () {
                          if (bloc.orderMain.order.status != "F") {
                            bloc.add(OrderItemNewEvent());
                          }
                        },
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                ContentOrderStockAdjustmentRegisterMaster(),
                ContentOrderStockAdjustmentRegisterDetail(),
              ],
            ),
            floatingActionButton: (bloc.orderMain.order.status != "F")
                ? FloatingActionButton(
                    onPressed: () {
                      bloc.orderMain.order.id > 0
                          ? bloc.add(OrderPutEvent())
                          : bloc.add(OrderPostEvent());
                    },
                    backgroundColor: Colors.black,
                    child: const Icon(Icons.save),
                  )
                : null,
          );
        },
      ),
    );
  }
}
