import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_situation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';

class OrderStockTransferRegisterDesktop extends StatefulWidget {
  const OrderStockTransferRegisterDesktop({
    Key? key,
    required this.bloc,
    this.orderStock,
  }) : super(key: key);

  final OrderStockTransferRegisterOrderModel? orderStock;
  final OrderStockTransferRegisterBloc bloc;
  @override
  State<OrderStockTransferRegisterDesktop> createState() =>
      _OrderStockTransferRegisterDesktopState();
}

class _OrderStockTransferRegisterDesktopState
    extends State<OrderStockTransferRegisterDesktop>
    with SingleTickerProviderStateMixin {
  OrderStockTransferRegisterOrderModel? orderStock;

  late MaskedTextController controllerDate;

  @override
  void initState() {
    orderStock = widget.orderStock;
    String initialValueDate = orderStock?.order.dtRecord == null
        ? OrderStockTransferRegisterOrderModel.formatDate(
            DateTime.now().toString(), "dd/MM/yyyy")
        : orderStock!.order.dtRecord.toString();
    orderStock?.order.copyWith(dtRecord: DateTime.tryParse(initialValueDate));
    controllerDate =
        MaskedTextController(mask: '00/00/0000', text: initialValueDate);

    orderStock?.order.copyWith(
      id: orderStock?.order.id == null
          ? widget.bloc.ordersStock.last.order.id + 1
          : orderStock!.order.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.bloc.add(OrderStockTransferRegisterGetListEvent());
        return true;
      },
      child: BlocConsumer<OrderStockTransferRegisterBloc,
          OrderStockTransferRegisterState>(
        bloc: widget.bloc,
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
                  widget.bloc.add(OrderStockTransferRegisterGetListEvent());
                },
              ),
              title: Text(
                orderStock == null
                    ? "Adicionar Ordem de Produção"
                    : "Editar Ordem de Produção",
                style: kHintTextStyle.copyWith(fontSize: 20.0),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                  onPressed: () {
                    // bloc.edit
                    //     ? bloc.add(OrderProductionRegisterPutEvent(
                    //         model: orderStock))
                    //     : bloc.add(OrderProductionRegisterPostEvent(
                    //         model: orderProduction));
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
                      title: "Número",
                      initialValue: orderStock?.order.id.toString(),
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.go,
                      onChanged: (value) =>
                          {orderStock?.order.copyWith(id: int.parse(value))}),
                  const SizedBox(height: 10),
                  // CustomInputButtonWidget(
                  //     bloc: bloc,
                  //     initialValue: orderStock?.nameEntity ?? "",
                  //     event: OrderProductionRegisterGetProductsEvent(
                  //       tbInstitutionId: 1,
                  //     ),
                  // title: "Descrição do Produto"),
                  const SizedBox(height: 10),
                  // CustomInputButtonWidget(
                  //     bloc: bloc,
                  //     initialValue: orderStock.order.nameStockListDes,
                  //     event: OrderProductionRegisterGetStocksEvent(
                  //         tbInstitutionId: 1),
                  //     title: "Descrição do estoque"),
                  const SizedBox(height: 10),
                  CustomInput(
                    title: "Data",
                    controller: controllerDate,
                    keyboardType: TextInputType.datetime,
                    inputAction: TextInputAction.go,
                    onChanged: (value) => {
                      orderStock?.order.copyWith(
                        dtRecord:
                            OrderStockTransferRegisterOrderModel.convertDate(
                          value,
                        ),
                      ),
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text("Situação", style: kLabelStyle),
                  const SizedBox(height: 10),
                  //TODO: criar situacao generica
                  OrderStockTransferRegisterSituationWidget(
                    status: orderStock?.order.status ?? 'A',
                  ),
                  const SizedBox(height: 10),
                  CustomInput(
                    title: "Observações",
                    maxLines: 10,
                    initialValue: orderStock?.order.note,
                    keyboardType: TextInputType.datetime,
                    inputAction: TextInputAction.go,
                    onChanged: (value) => {
                      orderStock?.order.copyWith(note: value),
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
