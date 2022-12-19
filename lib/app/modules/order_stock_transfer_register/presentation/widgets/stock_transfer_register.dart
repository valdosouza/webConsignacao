import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_generic_suffix_field.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_register_custom_input_button_generic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
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
  OrderStockTransferRegisterOrderModel? orderStock;

  TextEditingController dateController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController entityController = TextEditingController();
  TextEditingController stockOriController = TextEditingController();
  TextEditingController stockDesController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    orderStock = widget.orderStock;
    orderStock?.order.copyWith(
      id: orderStock?.order.id == null
          ? widget.bloc.ordersStock.last.order.id + 1
          : orderStock!.order.id,
    );
    String formattedDate = DateFormat('dd/MM/yyyy')
        .format(orderStock?.order.dtRecord ?? DateTime.now());
    dateController.text = formattedDate;
    numberController.text = orderStock?.order.number.toString() ?? '';
    entityController.text = orderStock?.order.nameEntity ?? '';
    stockOriController.text = orderStock?.order.nameStockListOri ?? '';
    stockDesController.text = orderStock?.order.nameStockListDes ?? '';
    noteController.text = orderStock?.order.note ?? '';
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
                    final dateFormat = DateFormat(
                      'dd/MM/yyyy',
                    );
                    final dtRecord = dateFormat.parse(
                      dateController.text,
                    );

                    final order = OrderStockTransferRegisterOrderModel(
                      order: Order(
                        id: int.tryParse(numberController.text) ?? 0,
                        tbInstitutionId: 1,
                        tbUserId: orderStock?.order.tbUserId ?? 0,
                        tbEntityId: 1,
                        nameEntity: entityController.text,
                        tbStockListIdOri: 1,
                        nameStockListOri: stockOriController.text,
                        tbStockListIdDes: 1,
                        nameStockListDes: stockDesController.text,
                        dtRecord: dtRecord,
                        number: int.tryParse(numberController.text) ?? 0,
                        status: 'A',
                        note: noteController.text,
                      ),
                      items: null,
                    );

                    print(order.toString());
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
                          print('Search Entity');
                          widget.bloc.add(
                            const OrderStockTransferGetStocksEvent(
                              tbInstitutionId: 1,
                            ),
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
                          print('Search Entity');
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
                          print('Search Entity');
                          widget.bloc.add(
                            const OrderStockTransferGetStocksEvent(
                              tbInstitutionId: 1,
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
      ),
    );
  }
}
