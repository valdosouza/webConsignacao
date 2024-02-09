// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widget/order_stock_adjustment_register_data.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widget/order_stock_adjustment_register_list_items.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

class ContentOrderStockAdjustmentRegisterDesktop extends StatefulWidget {
  final OrderStockAdjustmentRegisterModel orderStockAdjustment;
  final int tabIndex;
  const ContentOrderStockAdjustmentRegisterDesktop(
      {super.key, required this.orderStockAdjustment, this.tabIndex = 0});

  @override
  State<ContentOrderStockAdjustmentRegisterDesktop> createState() =>
      _ContentOrderStockAdjustmentRegisterDesktopState();
}

class _ContentOrderStockAdjustmentRegisterDesktopState
    extends State<ContentOrderStockAdjustmentRegisterDesktop>
    with SingleTickerProviderStateMixin {
  late OrderStockAdjustmentRegisterModel orderStockAdjustment;
  late TabController _tabController;

  late final OrderStockAdjustmentRegisterBloc bloc;
  late MaskedTextController controllerDate;

  @override
  void initState() {
    bloc = Modular.get();
    orderStockAdjustment = widget.orderStockAdjustment;
    String initialValueDate = orderStockAdjustment.dtRecord == ""
        ? OrderStockAdjustmentRegisterModel.formatDate(
            DateTime.now().toString(), "dd/MM/yyyy")
        : orderStockAdjustment.dtRecord;
    orderStockAdjustment.dtRecord = initialValueDate;
    controllerDate =
        MaskedTextController(mask: '00/00/0000', text: initialValueDate);

    orderStockAdjustment.id = orderStockAdjustment.id == 0
        ? bloc.orderStockAdjustments.isEmpty
            ? 1
            : bloc.orderStockAdjustments.last.id + 1
        : orderStockAdjustment.id;
    _tabController = TabController(vsync: this, length: 2);
    _tabController.animateTo(widget.tabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        bloc.add(OrderStockAdjustmentRegisterGetListEvent());
      },
      child: BlocConsumer<OrderStockAdjustmentRegisterBloc,
          OrderStockAdjustmentRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is OrderStockAdjustmentRegisterStockErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
          if (state is OrderStockAdjustmentRegisterProductErrorState) {
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
                icon: const Icon(Icons.arrow_back_ios_outlined,
                    color: kSecondaryColor),
                onPressed: () {
                  bloc.add(OrderStockAdjustmentRegisterGetListEvent());
                },
              ),
              title: AutoSizeText(
                bloc.edit
                    ? "Editar Ordem de Ajuste de Estoque"
                    : "Adicionar Ordem de Ajuste de Estoque",
                style: kTitleAppBarStyle,
              ),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    (bloc.orderStockAdjustment.status != "F")
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
                        'Itens para ajustar',
                        style: TextStyle(color: Colors.white),
                      )),
                      trailing: IconButton(
                          onPressed: () {
                            if (bloc.orderStockAdjustment.status != "F") {
                              bloc.add(OrderStockAdjustmentRegisterItemEvent());
                            }
                          },
                          icon: const Icon(Icons.add, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(controller: _tabController, children: [
              OrderStockAdjustmentRegisterData(
                  orderStockAdjust: orderStockAdjustment,
                  bloc: bloc,
                  controllerDate: controllerDate),
              OrderStockAdjustmentRegisterItemsListWidget(
                orderStockAdjust: orderStockAdjustment,
              ),
            ]),
            floatingActionButton: (bloc.orderStockAdjustment.status != "F")
                ? FloatingActionButton(
                    onPressed: () {
                      bloc.edit
                          ? bloc.add(OrderStockAdjustmentRegisterPutEvent(
                              model: orderStockAdjustment))
                          : bloc.add(OrderStockAdjustmentRegisterPostEvent(
                              model: orderStockAdjustment));
                    },
                    backgroundColor: Colors.black,
                    child: const Icon(Icons.save, color: kSecondaryColor),
                  )
                : null,
          );
        },
      ),
    );
  }
}
