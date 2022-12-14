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
import 'package:appweb/app/modules/order_production_register/presentation/widgets/order_production_register_custom_input_button_widget.dart';
import 'package:appweb/app/modules/order_production_register/presentation/widgets/order_production_register_situation_widget.dart';

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
    bloc.orderProduction.tbInstitutionId = 1;
    bloc.orderProduction.tbUserId = 2;
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
        bloc.add(OrderProductionRegisterGetListEvent());
        return true;
      },
      child: BlocConsumer<OrderProductionRegisterBloc,
          OrderProductionRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is OrderProductionRegisterStockErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar por estoque. Tente novamente mais tarde.");
          }
          if (state is OrderProductionRegisterProductErrorState) {
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
                    bloc.add(OrderProductionRegisterGetListEvent());
                  },
                ),
                title: Text(
                  bloc.edit
                      ? "Editar Ordem de Produ????o"
                      : "Adicionar Ordem de Produ????o",
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
                          ? bloc.add(OrderProductionRegisterPutEvent(
                              model: bloc.orderProduction))
                          : bloc.add(OrderProductionRegisterPostEvent(
                              model: bloc.orderProduction));
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInput(
                        title: "Data",
                        controller: controllerDate,
                        keyboardType: TextInputType.datetime,
                        inputAction: TextInputAction.go,
                        onChanged: (value) =>
                            {bloc.orderProduction.dtRecord = value}),
                    CustomInput(
                        title: "N??mero",
                        initialValue: bloc.orderProduction.number.toString(),
                        keyboardType: TextInputType.number,
                        inputAction: TextInputAction.go,
                        onChanged: (value) =>
                            {bloc.orderProduction.number = int.parse(value)}),
                    const SizedBox(height: 10),
                    CustomInputButtonWidget(
                        bloc: bloc,
                        initialValue: bloc.orderProduction.nameMerchandise,
                        event: OrderProductionRegisterGetProductsEvent(
                            tbInstitutionId: 1),
                        title: "Descri????o do Produto"),
                    const SizedBox(height: 10),
                    CustomInputButtonWidget(
                        bloc: bloc,
                        initialValue: bloc.orderProduction.nameStockListDes,
                        event: OrderProductionRegisterGetStocksEvent(
                            tbInstitutionId: 1),
                        title: "Descri????o do estoque"),
                    const SizedBox(height: 10),
                    CustomInput(
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
                    const Text("Situa????o", style: kLabelStyle),
                    const SizedBox(height: 10),
                    OrderProductionRegisterSituationWidget(
                        orderProduction: bloc.orderProduction),
                    const SizedBox(height: 10),
                    CustomInput(
                        title: "Observa????es",
                        maxLines: 10,
                        initialValue: bloc.orderProduction.note,
                        keyboardType: TextInputType.datetime,
                        inputAction: TextInputAction.go,
                        onChanged: (value) =>
                            {bloc.orderProduction.note = value})
                  ],
                ),
              ));
        },
      ),
    );
  }
}
