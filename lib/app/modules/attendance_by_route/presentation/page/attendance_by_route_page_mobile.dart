import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_event.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_state.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/content/customer_list_mobile.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/content/sales_route_list_mobile.dart';

import '../../attendance_by_route_module.dart';

class AttendanceByRoutePageMobile extends StatefulWidget {
  final int tbSalesRouteId;
  final String nameSalesRoute;
  final int tbRegionId;
  final String nameRegion;
  const AttendanceByRoutePageMobile({
    super.key,
    required this.tbSalesRouteId,
    required this.nameSalesRoute,
    required this.tbRegionId,
    required this.nameRegion,
  });

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
    bloc.tbSalesRouteIdSelected = widget.tbSalesRouteId;
    bloc.salesRouteSelected = widget.nameSalesRoute;
    bloc.tbRegionIdSelected = widget.tbRegionId;
    bloc.regionSelected = widget.nameRegion;
    if (widget.tbSalesRouteId == 0) {
      bloc.add(SalesRouteGetListEvent());
    } else {
      bloc.add(
        CustomerGetListEvent(
          params: ParamsGetListCustomerByRoute(
            tbSalesRouteId: bloc.tbSalesRouteIdSelected,
            tbRegionId: bloc.tbRegionIdSelected,
            dtRecord: bloc.dtRecordSelected,
            kind: bloc.kindSelected,
          ),
        ),
      );
    }
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
        if ((state is SalesRouteListLoadingState) ||
            (state is CustomerListLoadingState)) {
          return const CustomCircularProgressIndicator();
        }
        if (state is SalesRouteListLoadedState) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: AutoSizeText(
                'Rotas de ${bloc.regionSelected}',
                style: kTitleAppBarStyle,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined,
                    color: kSecondaryColor),
                onPressed: () {
                  Modular.to.navigate('/customer/mobile/');
                },
              ),
            ),
            body: SalesRouteListMobile(lista: bloc.saleroutlist),
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
                    title: const AutoSizeText(
                      'Ordenar Lista de Clientes',
                      style: kTitleAppBarStyle,
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.close, color: kSecondaryColor),
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
                    title: AutoSizeText(
                      ' ${bloc.salesRouteSelected} - ${bloc.customerlist.length} clientes',
                      style: kTitleAppBarStyle,
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_outlined,
                          color: kSecondaryColor),
                      onPressed: () {
                        bloc.add(SalesRouteGetListEvent());
                      },
                    ),
                  ),
            body: CustomerListMobile(lista: bloc.customerlist),
          );
        }
        return Container();
      },
    );
  }
}
