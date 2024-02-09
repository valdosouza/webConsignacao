import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_state.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/content/historic/content_order_sale_historic.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/content/historic/content_order_sale_list.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/content/register/content_order_sale_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

class OrderSaleRegisterPageMobile extends StatefulWidget {
  final OrderAttendanceModel orderAttendance;
  final bool historic;
  const OrderSaleRegisterPageMobile({
    super.key,
    required this.orderAttendance,
    required this.historic,
  });

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
    if (!widget.historic) {
      bloc.stage = 1;
      bloc.add(OrderSaleRegisterGetCardEvent(
        tbPriceListId: widget.orderAttendance.tbPriceListId,
      ));
    } else {
      bloc.stage = 2;
      bloc.add(OrderSaleRegisterGetlistEvent(
          params: ParamsOrderSaleList(
        tbInstitutionId: 0,
        page: 0,
        tbSalesmanId: 0,
        number: 0,
        tbCustomerId: bloc.modelAttendance.tbCustomerId,
        nickTrade: "",
      )));
    }
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
          CustomToast.showToast(state.error);
        }
      },
      builder: (context, state) {
        if (state is OrderSaleCardPostSucessState) {
          Modular.to.navigate('/customer/mobile/');
        }
        if (state is OrderSaleCardPostErrorState) {
          return const ContentOrderSaleRegister();
        }

        if (state is OrderSaleRegisterLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }
        if (state is OrderSaleGetNewCardListLoadedState) {
          return const ContentOrderSaleRegister();
        }
        if (state is ReturnToOrderSaleState) {
          return const ContentOrderSaleRegister();
        }
        if (state is ReturnToAttendanceState) {
          Modular.to.navigate('/attendance/', arguments: bloc.modelAttendance);
        }

        if (state is OrderSaleCardPostSucessState) {
          Modular.to.navigate('/customer/mobile/');
        }
        if (state is OrderSaleGetListLoadedState) {
          return ContentOrderSaleList(orderList: state.orderList);
        }
        if (state is GetOrderSaleCardLoadedState) {
          return ContentOrderSaleHistoric(model: state.orderMain);
        }
        return Container();
      },
    );
  }
}
