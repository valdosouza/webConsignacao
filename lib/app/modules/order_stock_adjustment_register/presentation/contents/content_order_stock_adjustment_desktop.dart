// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widgets/order_stock_adjustment_register_custom_input_button_widget.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widgets/order_stock_adjustment_register_direction_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';

class ContentOrderStockAdjustmentRegisterDesktop extends StatefulWidget {
  final OrderStockAdjustmentRegisterModel orderStockAdjustment;
  const ContentOrderStockAdjustmentRegisterDesktop({
    Key? key,
    required this.orderStockAdjustment,
  }) : super(key: key);

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

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Dados do Ajuste'),
    const Tab(text: 'Itens para ajustar')
  ];

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
    _tabController = TabController(vsync: this, length: myTabs.length);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(OrderStockAdjustmentRegisterGetListEvent());
        return true;
      },
      child: BlocConsumer<OrderStockAdjustmentRegisterBloc,
          OrderStockAdjustmentRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is OrderStockAdjustmentRegisterStockErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar por estoque. Tente novamente mais tarde.");
          }
          if (state is OrderStockAdjustmentRegisterProductErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar por produto. Tente novamente mais tarde.");
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
                  bloc.add(OrderStockAdjustmentRegisterGetListEvent());
                },
              ),
              title: Text(
                bloc.edit
                    ? "Editar Ordem de Ajuste de Estoque"
                    : "Adicionar Ordem de Ajuste de Estoque",
                style: kHintTextStyle.copyWith(fontSize: 20.0),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                  onPressed: () {
                    bloc.edit
                        ? bloc.add(OrderStockAdjustmentRegisterPutEvent(
                            model: orderStockAdjustment))
                        : bloc.add(OrderStockAdjustmentRegisterPostEvent(
                            model: orderStockAdjustment));
                  },
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorWeight: 2.0,
                indicatorColor: Colors.black,
                tabs: myTabs,
              ),
            ),
            body: TabBarView(controller: _tabController, children: [
              content_register(
                  orderStockAdjustment: orderStockAdjustment,
                  bloc: bloc,
                  controllerDate: controllerDate),
              content_register(
                  orderStockAdjustment: orderStockAdjustment,
                  bloc: bloc,
                  controllerDate: controllerDate),
            ]),
          );
        },
      ),
    );
  }
}

class content_register extends StatelessWidget {
  const content_register({
    Key? key,
    required this.orderStockAdjustment,
    required this.bloc,
    required this.controllerDate,
  }) : super(key: key);

  final OrderStockAdjustmentRegisterModel orderStockAdjustment;
  final OrderStockAdjustmentRegisterBloc bloc;
  final MaskedTextController controllerDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
              title: "Data",
              controller: controllerDate,
              keyboardType: TextInputType.datetime,
              inputAction: TextInputAction.go,
              onChanged: (value) => {orderStockAdjustment.dtRecord = value}),
          const SizedBox(height: 10),
          CustomInput(
              title: "Número",
              initialValue: orderStockAdjustment.number.toString(),
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.go,
              onChanged: (value) =>
                  {orderStockAdjustment.number = int.parse(value)}),
          const SizedBox(height: 10),
          CustomInputButtonWidget(
              bloc: bloc,
              initialValue: orderStockAdjustment.nameEntity,
              event: OrderStockAdjustmentRegisterGetEntityEvent(),
              title: "Descrição da Entidade"),
          const SizedBox(height: 10),
          CustomInputButtonWidget(
              bloc: bloc,
              initialValue: bloc.sotck.description,
              event: OrderStockAdjustmentRegisterGetStocksEvent(
                  tbInstitutionId: 1),
              title: "Descrição do estoque"),
          const SizedBox(height: 10),
          const Text("Direção da Operação", style: kLabelStyle),
          const SizedBox(height: 10),
          OrderStockAdjustmentRegisterDirectionWidget(
              orderStockAdjustment: orderStockAdjustment),
          const SizedBox(height: 10),
          CustomInput(
              title: "Observações",
              maxLines: 10,
              initialValue: orderStockAdjustment.note,
              keyboardType: TextInputType.datetime,
              inputAction: TextInputAction.go,
              onChanged: (value) => {orderStockAdjustment.note = value})
        ],
      ),
    );
  }
}