// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';

import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';
import 'package:appweb/app/modules/order_production_register/presentation/widget/order_production_register_custom_input_button_widget.dart';
import 'package:appweb/app/modules/order_production_register/presentation/widget/order_production_register_situation_widget.dart';

class ContentOrderProductionRegisterDesktop extends StatefulWidget {
  const ContentOrderProductionRegisterDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentOrderProductionRegisterDesktop> createState() =>
      _ContentOrderProductionRegisterDesktopState();
}

class _ContentOrderProductionRegisterDesktopState
    extends State<ContentOrderProductionRegisterDesktop>
    with SingleTickerProviderStateMixin {
  late final OrderProductionRegisterBloc bloc;
  late MaskedTextController controllerDate;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderProductionRegisterBloc>();

    String initialValueDate = bloc.orderProduction.dtRecord == ""
        ? CustomDate.newDate()
        : bloc.orderProduction.dtRecord;
    bloc.orderProduction.dtRecord = initialValueDate;
    controllerDate =
        MaskedTextController(mask: '00/00/0000', text: initialValueDate);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(OrderGetListEvent());
        return true;
      },
      child: BlocConsumer<OrderProductionRegisterBloc,
          OrderProductionRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is OrderGetStockErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados do cadastro. Tente novamente mais tarde.");
          }
          if (state is OrderGetProductErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados do cadastro. Tente novamente mais tarde.");
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
                (bloc.orderProduction.id > 0)
                    ? "Editar Ordem de Produção"
                    : "Adicionar Ordem de Produção",
                style: kHintTextStyle.copyWith(fontSize: 20.0),
              ),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    (bloc.orderProduction.status != "F")
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
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInput(
                        readOnly: (bloc.orderProduction.status == "F"),
                        title: "Data",
                        controller: controllerDate,
                        keyboardType: TextInputType.datetime,
                        inputAction: TextInputAction.go,
                        onChanged: (value) =>
                            {bloc.orderProduction.dtRecord = value}),
                    CustomInput(
                        readOnly: (bloc.orderProduction.status == "F"),
                        title: "Número",
                        initialValue: bloc.orderProduction.number.toString(),
                        keyboardType: TextInputType.number,
                        inputAction: TextInputAction.go,
                        onChanged: (value) =>
                            {bloc.orderProduction.number = int.parse(value)}),
                    const SizedBox(height: 10),
                    CustomInputButtonWidget(
                        readOnly: (bloc.orderProduction.status == "F"),
                        bloc: bloc,
                        initialValue: bloc.orderProduction.nameMerchandise,
                        event: OrderGetProductsEvent(),
                        title: "Descrição do Produto"),
                    const SizedBox(height: 10),
                    CustomInputButtonWidget(
                        readOnly: (bloc.orderProduction.status == "F"),
                        bloc: bloc,
                        initialValue: bloc.orderProduction.nameStockListDes,
                        event: OrderGetStocksEvent(),
                        title: "Descrição do estoque"),
                    const SizedBox(height: 10),
                    CustomInput(
                        readOnly: (bloc.orderProduction.status == "F"),
                        title: "Quantidade",
                        initialValue:
                            bloc.orderProduction.qttyForecast.toString(),
                        keyboardType: TextInputType.number,
                        inputAction: TextInputAction.go,
                        onChanged: (value) => {
                              bloc.orderProduction.qttyForecast =
                                  int.parse(value)
                            }),
                    const SizedBox(height: 10),
                    const Text("Situação", style: kLabelStyle),
                    const SizedBox(height: 10),
                    OrderProductionRegisterSituationWidget(
                        orderProduction: bloc.orderProduction),
                    const SizedBox(height: 10),
                    CustomInput(
                        readOnly: (bloc.orderProduction.status == "F"),
                        title: "Observações",
                        maxLines: 10,
                        initialValue: bloc.orderProduction.note,
                        keyboardType: TextInputType.multiline,
                        inputAction: TextInputAction.go,
                        onChanged: (value) =>
                            {bloc.orderProduction.note = value})
                  ],
                ),
              ),
            ),
            floatingActionButton: (bloc.orderProduction.status != "F")
                ? FloatingActionButton(
                    onPressed: () {
                      (bloc.orderProduction.id > 0)
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
