import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/enum/order_stock_transfer_type_enum.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_customer_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_register_list_stocks.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_widget.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/stock_transfer_register.dart';
import 'package:appweb/app/modules/stock/stock_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockTransferRegisterPageDesktop extends StatefulWidget {
  const OrderStockTransferRegisterPageDesktop({super.key});

  @override
  State<OrderStockTransferRegisterPageDesktop> createState() =>
      OrderStockTransferRegisterPageDesktopState();
}

class OrderStockTransferRegisterPageDesktopState
    extends State<OrderStockTransferRegisterPageDesktop> {
  late OrderStockTransferRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockModule>();
    });
    bloc = Modular.get<OrderStockTransferRegisterBloc>();
    bloc.add(OrderStockTransferRegisterGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderStockTransferRegisterBloc,
        OrderStockTransferRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is OrderStockTransferRegisterErrorState) {
          CustomToast.showToast(
              "Ocorreu um erro ao buscar por estoque. Tente novamente mais tarde.");
          return Container(
            color: Colors.red,
          );
        } else if (state is OrderStockTransferRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OrderStockTransferRegisterEntitiesSuccessState) {
          return OrderStockCustomerList(
            customers: state.entities,
            onClickItem: (entitySelected) {
              bloc.add(
                OrderStockTransferRegisterGetEvent(
                  id: bloc.orderStock!.order.id,
                  entity: entitySelected,
                ),
              );
            },
          );
        } else if (state is OrderStockTransferRegisterStockOriSuccessState) {
          bloc.add(
            OrderStockTransferRegisterGetEvent(
              id: bloc.orderStock!.order.id,
              stockOri: state.stock,
            ),
          );
          return const CircularProgressIndicator();
        } else if (state is OrderStockTransferRegisterStockDesSuccessState) {
          bloc.add(
            OrderStockTransferRegisterGetEvent(
              id: bloc.orderStock!.order.id,
              stockDes: state.stock,
            ),
          );
          return const CircularProgressIndicator();
        } else if (state is OrderStockTransferRegisterStockSuccessState) {
          return OrderStockTransferRegisterStockListWidget(
            stocks: state.stocks,
            onClickItem: ((stockSelected) {
              bloc.add(
                state.type == OrderStockTransferRegisterStockType.ori
                    ? OrderStockTransferRegisterStockOriEvent(
                        stock: stockSelected,
                        // orderId: 1,
                      )
                    : OrderStockTransferRegisterStockDesEvent(
                        stock: stockSelected,
                        // orderId: 1,
                      ),
              );
            }),
            // searchFunction: (a) => bloc.add(
            //   OrderStockTransferRegisterGetListEvent(),
            // ),
          );
        } else if (state is OrderStockTransferRegisterLoadedState) {
          return OrderStockTransferList(
            orderStock: state.list,
            bloc: bloc,
          );
        } else if (state is OrderStockTransferAddOrEditOrderState) {
          return OrderStockTransferRegisterDesktop(
            orderStock: state.order,
            bloc: bloc,
          );
        }
        return const Center(
          child: Text("Não encontramos nenhum registro em nossa base."),
        );
      },
    );
  }
}
