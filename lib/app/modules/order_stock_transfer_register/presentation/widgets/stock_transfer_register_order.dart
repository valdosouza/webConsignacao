import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/enum/order_stock_transfer_type_enum.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_generic_suffix_field.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_register_custom_input_button_generic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
  TextEditingController dateController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController entityController = TextEditingController();
  TextEditingController stockOriController = TextEditingController();
  TextEditingController stockDesController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.orderStock?.order.copyWith(
      id: widget.orderStock?.order.id == null
          ? widget.bloc.ordersStock.last.order.id + 1
          : widget.orderStock!.order.id,
    );
    String formattedDate = DateFormat('dd/MM/yyyy')
        .format(widget.orderStock?.order.dtRecord ?? DateTime.now());
    dateController.text = formattedDate;
    numberController.text = widget.orderStock?.order.number.toString() ?? '';
    entityController.text = widget.orderStock?.order.nameEntity ?? '';
    stockOriController.text = widget.orderStock?.order.nameStockListOri ?? '';
    stockDesController.text = widget.orderStock?.order.nameStockListDes ?? '';
    noteController.text = widget.orderStock?.order.note ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderStockTransferRegisterBloc,
        OrderStockTransferRegisterState>(
      bloc: widget.bloc,
      listener: (context, state) {
        if (state is OrderStockTransferRegisterStockErrorState) {
          CustomToast.showToast(
              "Ocorreu um erro ao buscar por estoque. Tente novamente mais tarde.");
        }
        if (state is OrderStockTransferRegisterEntityState) {
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
                widget.bloc.add(
                  OrderStockTransferRegisterGetListEvent(),
                );
              },
            ),
            title: Text(
              widget.orderStock == null
                  ? "Adicionar Ordem de Transferencia de Estoque"
                  : "Editar Ordem de Transferencia de Estoque",
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
                  final dateFormat = DateFormat(
                    'dd/MM/yyyy',
                  );
                  final dtRecord = dateFormat.parse(
                    dateController.text,
                  );

                  if (widget.orderStock != null) {
                    final order = widget.orderStock!.order;
                    final a = widget.bloc.orderStock!.copyWith(
                      order: Order(
                        id: order.id,
                        tbInstitutionId: 1,
                        tbUserId: order.tbUserId,
                        tbEntityId: order.tbEntityId,
                        nameEntity: entityController.text,
                        tbStockListIdOri: order.tbStockListIdOri,
                        nameStockListOri: stockOriController.text,
                        tbStockListIdDes: order.tbStockListIdDes,
                        nameStockListDes: stockDesController.text,
                        dtRecord: order.dtRecord,
                        number: int.tryParse(numberController.text) ?? 0,
                        status: order.status,
                        note: noteController.text,
                      ),
                    );
                    print(a.toString());
                  }
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputButtonGenericWidget(
                    title: "Data",
                    controller: dateController,
                    textInputType: TextInputType.datetime,
                    textInputAction: TextInputAction.go,
                  ),
                  const SizedBox(height: 10),
                  CustomInputButtonGenericWidget(
                    title: "Número",
                    controller: numberController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                  ),
                  const SizedBox(height: 10),
                  CustomInputButtonGenericWidget(
                    controller: entityController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    title: "Entidade",
                    suffixIcon: OrderStockTransferRegisterGenericSuffixField(
                      icon: Icons.search,
                      onPressed: (() {
                        widget.bloc.add(
                          OrderStockTransferGetEntitiesEvent(),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomInputButtonGenericWidget(
                    controller: stockOriController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    title: "Estoque de Origem",
                    suffixIcon: OrderStockTransferRegisterGenericSuffixField(
                      icon: Icons.search,
                      onPressed: (() {
                        widget.bloc.add(
                          const OrderStockTransferGetStocksEvent(
                            tbInstitutionId: 1,
                            // orderId: orderStock?.order.id,
                            type: OrderStockTransferRegisterStockType.ori,
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomInputButtonGenericWidget(
                    controller: stockDesController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    title: "Estoque de Destino",
                    suffixIcon: OrderStockTransferRegisterGenericSuffixField(
                      icon: Icons.search,
                      onPressed: (() {
                        widget.bloc.add(
                          const OrderStockTransferGetStocksEvent(
                            tbInstitutionId: 1,
                            // orderId: orderStock?.order.id,
                            type: OrderStockTransferRegisterStockType.des,
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomInputButtonGenericWidget(
                    controller: noteController,
                    title: "Observações",
                    maxLines: 10,
                    textInputType: TextInputType.datetime,
                    textInputAction: TextInputAction.go,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
