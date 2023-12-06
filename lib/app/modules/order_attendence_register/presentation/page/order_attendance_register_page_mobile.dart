import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/order_attendence_register/order_attendance_register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_bloc.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_event.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_state.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/content/content_order_attendance_register_mobile.dart';

class OrderAttendanceRegisterPageMobile extends StatefulWidget {
  final OrderAttendanceModel model;
  const OrderAttendanceRegisterPageMobile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<OrderAttendanceRegisterPageMobile> createState() =>
      OrderAttendanceRegisterPageMobileState();
}

class OrderAttendanceRegisterPageMobileState
    extends State<OrderAttendanceRegisterPageMobile> {
  late final OrderAttendanceRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderAttendanceRegisterModule>();
    });

    bloc = Modular.get<OrderAttendanceRegisterBloc>();
    bloc.orderAttendance = widget.model;
    bloc.add(OrderAttendanceGetPriceListEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderAttendanceRegisterBloc,
        OrderAttendanceRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is OrderAttendanceRegisterGetPriceListErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde");
        } else if ((state is OrderAttendanceRegisterPostSuccessState) ||
            (state is OrderAttendanceRegisterPutSuccessState)) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is OrderAttendanceRegisterPostErrorState) {
          CustomToast.showToast(state.error);
        } else if (state is OrderAttendanceRegisterPutErrorState) {
          CustomToast.showToast(state.error);
        }
      },
      builder: (context, state) {
        if (state is OrderAttendanceRegisterLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }
        if ((state is OrderAttendanceRegisterGetPriceListSuccessState) ||
            (state is OrderAttendanceRegisterPostErrorState)) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: Text(bloc.orderAttendance.nameCustomer),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  if (bloc.orderAttendance.routeRetorn.isNotEmpty) {
                    Modular.to
                        .navigate(bloc.orderAttendance.routeRetorn, arguments: [
                      bloc.orderAttendance.tbSalesRouteId,
                      bloc.orderAttendance.nameSalesRoute,
                      bloc.orderAttendance.tbRegionId,
                      bloc.orderAttendance.nameRegion,
                    ]);
                  } else {
                    Modular.to.navigate('/customer/mobile/');
                  }
                },
              ),
            ),
            body: const ContentOrderAttendanceRegisterMobile(),
          );
        }
        if ((state is OrderAttendanceRegisterPostErrorState) ||
            (state is OrderAttendanceRegisterPutErrorState)) {
          Modular.to.navigate('/customer/mobile/');
        }
        if ((state is OrderAttendanceRegisterPostSuccessState) ||
            (state is OrderAttendanceRegisterPutSuccessState)) {
          switch (bloc.orderAttendance.tbPriceListId) {
            case 0:
              if (bloc.orderAttendance.routeRetorn.isNotEmpty) {
                Modular.to
                    .navigate(bloc.orderAttendance.routeRetorn, arguments: [
                  bloc.orderAttendance.tbSalesRouteId,
                  bloc.orderAttendance.nameSalesRoute,
                  bloc.orderAttendance.tbRegionId,
                  bloc.orderAttendance.nameRegion,
                ]);
              } else {
                Modular.to.navigate('/customer/mobile/');
              }
              break;
            case 1:
              Modular.to.navigate('/consignment/',
                  arguments: [bloc.orderAttendance, false]);
              break;
            case 2:
              Modular.to
                  .navigate('/ordersale/', arguments: bloc.orderAttendance);
              break;
            case 3:
              Modular.to
                  .navigate('/ordersale/', arguments: bloc.orderAttendance);
              break;
          }
        }
        return const Center(
          child: CustomCircularProgressIndicator(),
        );
      },
    );
  }
}
