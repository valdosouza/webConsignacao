import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_event.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_state.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/content/customer_list_mobile.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/content/sales_route_list_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../attendance_by_route_module.dart';

class AttendanceByRoutePageMobile extends StatefulWidget {
  const AttendanceByRoutePageMobile({super.key});

  @override
  State<AttendanceByRoutePageMobile> createState() =>
      SalesRoutetRegisterInterationPageState();
}

class SalesRoutetRegisterInterationPageState
    extends State<AttendanceByRoutePageMobile> {
  late final AttendanceByRouteBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AttendanceByRouteBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceByRouteModule>();
    });
    bloc.add(SalesRouteGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceByRouteBloc, AttendanceByRouteState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SalesRouteListErrorState) {
          CustomToast.showToast(
              "buscar os cadastros. Tente novamente mais tarde.");
        }
        if (state is CustomerListOrderErrorState) {
          CustomToast.showToast(
              "Erro ao ordenar a lista. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is SalesRouteListLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        if (state is SalesRouteListLoadedState) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: const Text('Lista de Rotas'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Modular.to.navigate('/customer/mobile/');
                },
              ),
            ),
            body: SalesRouteListMobile(lista: state.salesRouteList),
          );
        }
        if (state is CustomerListLoadedState ||
            state is CustomerListOrderState ||
            state is CustomerListOrderErrorState) {
          state = state as CustomerListState;
          return Scaffold(
            appBar: (state is CustomerListOrderState)
                ? AppBar(
                    flexibleSpace: Container(
                      decoration: kBoxDecorationflexibleSpace,
                    ),
                    title: const Text('Ordenar Lista de Clientes'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          bloc.add(CustomerCancelOrderModeEvent());
                        },
                      )
                    ],
                  )
                : AppBar(
                    flexibleSpace: Container(
                      decoration: kBoxDecorationflexibleSpace,
                    ),
                    title: Text(
                        'Lista de Clientes (${state.customerList.length})'),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        bloc.add(SalesRouteGetListEvent());
                      },
                    ),
                  ),
            body: CustomerListMobile(lista: state.customerList),
          );
        }
        return Container();
      },
    );
  }
}
