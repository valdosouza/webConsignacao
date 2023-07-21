// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_bloc.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_event.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_state.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/widget/order_bonus_register_data.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/widget/order_bonus_register_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

class ContentOrderBonusRegisterDesktop extends StatefulWidget {
  final OrderBonusRegisterModel orderBonus;
  final int tabIndex;
  const ContentOrderBonusRegisterDesktop(
      {Key? key, required this.orderBonus, this.tabIndex = 0})
      : super(key: key);

  @override
  State<ContentOrderBonusRegisterDesktop> createState() =>
      _ContentOrderBonusRegisterDesktopState();
}

class _ContentOrderBonusRegisterDesktopState
    extends State<ContentOrderBonusRegisterDesktop>
    with SingleTickerProviderStateMixin {
  late OrderBonusRegisterModel orderBonus;
  late TabController _tabController;

  late final OrderBonusRegisterBloc bloc;
  late MaskedTextController controllerDate;

  @override
  void initState() {
    bloc = Modular.get();
    orderBonus = widget.orderBonus;
    String initialValueDate = orderBonus.dtRecord == ""
        ? OrderBonusRegisterModel.formatDate(
            DateTime.now().toString(), "dd/MM/yyyy")
        : orderBonus.dtRecord;
    orderBonus.dtRecord = initialValueDate;
    controllerDate =
        MaskedTextController(mask: '00/00/0000', text: initialValueDate);

    orderBonus.id = orderBonus.id == 0
        ? bloc.orderBonuss.isEmpty
            ? 1
            : bloc.orderBonuss.last.id + 1
        : orderBonus.id;
    _tabController = TabController(vsync: this, length: 2);
    _tabController.animateTo(widget.tabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(OrderBonusRegisterGetListEvent());
        return true;
      },
      child: BlocConsumer<OrderBonusRegisterBloc, OrderBonusRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is OrderBonusRegisterStockErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
          if (state is OrderBonusRegisterProductErrorState) {
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
                  bloc.add(OrderBonusRegisterGetListEvent());
                },
              ),
              title: Text(
                bloc.edit
                    ? "Editar Ordem de Bonificação"
                    : "Adicionar Ordem de Bonificação",
                style: kHintTextStyle.copyWith(fontSize: 20.0),
              ),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    (bloc.orderBonus.status != "F")
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
                  const Tab(text: 'Dados da Bonificação'),
                  Tab(
                    child: ListTile(
                      title: const Center(
                          child: Text(
                        'Itens para ajustar',
                        style: TextStyle(color: Colors.white),
                      )),
                      trailing: IconButton(
                          onPressed: () {
                            if (bloc.orderBonus.status != "F") {
                              bloc.add(OrderBonusRegisterItemEvent());
                            }
                          },
                          icon: const Icon(Icons.add, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(controller: _tabController, children: [
              OrderBonusRegisterData(
                  orderBonus: orderBonus,
                  bloc: bloc,
                  controllerDate: controllerDate),
              OrderBonusRegisterItemsListWidget(
                orderBonus: orderBonus,
              ),
            ]),
            floatingActionButton: (bloc.orderBonus.status != "F")
                ? FloatingActionButton(
                    onPressed: () {
                      bloc.edit
                          ? bloc.add(
                              OrderBonusRegisterPutEvent(model: orderBonus))
                          : bloc.add(
                              OrderBonusRegisterPostEvent(model: orderBonus));
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
