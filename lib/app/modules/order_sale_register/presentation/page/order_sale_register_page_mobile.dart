import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_state.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/content/content_order_sale_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

class OrderSaleRegisterPageMobile extends StatefulWidget {
  final OrderAttendanceModel orderAttendance;
  const OrderSaleRegisterPageMobile({
    Key? key,
    required this.orderAttendance,
  }) : super(key: key);

  @override
  State<OrderSaleRegisterPageMobile> createState() =>
      OrderSaleRegisterPageMobileState();
}

class OrderSaleRegisterPageMobileState
    extends State<OrderSaleRegisterPageMobile> {
  late final OrderSaleRegisterBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = Modular.get<OrderSaleRegisterBloc>();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderSaleRegisterModule>;
    });
    bloc.modelAttendance = widget.orderAttendance;
    bloc.add(OrderSaleRegisterGetCardEvent(
      tbPriceListId: widget.orderAttendance.tbPriceListId,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderSaleRegisterBloc, OrderSaleRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is OrderSaleGetNewCardListErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde");
          Modular.to.navigate('/attendance/');
        } else if (state is OrderSaleCardPostErrorState) {
          CustomToast.showToast("Erro ao gravar a venda.Tente novamente");
        }
      },
      builder: (context, state) {
        if (state is OrderSaleCardPostSucessState) {
          Modular.to.navigate('/customer/mobile/');
        }
        if (state is OrderSaleCardPostErrorState) {
          return ContentOrderSaleRegister(orderSale: bloc.modelOrderSale);
        }

        if (state is OrderSaleRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OrderSaleGetNewCardListLoadedState) {
          return ContentOrderSaleRegister(orderSale: state.model);
        }
        if (state is OrderSaleCardPostSucessState) {
          Modular.to.navigate('/customer/mobile/');
        }
        return Container();
      },
    );
  }
}
