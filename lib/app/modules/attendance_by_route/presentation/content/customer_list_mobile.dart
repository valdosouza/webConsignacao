import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_set_turn_back.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_event.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_state.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/link.dart';

class CustomerListMobile extends StatefulWidget {
  const CustomerListMobile({
    Key? key,
    required this.lista,
  }) : super(key: key);
  final List<CustomerListByRouteModel> lista;
  @override
  State<CustomerListMobile> createState() => SalesRoutListeMobileState();
}

class SalesRoutListeMobileState extends State<CustomerListMobile> {
  late AttendanceByRouteBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AttendanceByRouteBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    final List<String> kindFilter = [
      'Atender',
      'Atendidos',
      'Retorno',
      'Recolhido',
      'Todos',
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Filtro: ',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: DropdownButton<String>(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        value: bloc.kindSelected,
                        isDense: true,
                        isExpanded: true,
                        onChanged: (newValue) {
                          bloc.kindSelected = newValue!;
                          bloc.add(
                            CustomerGetListEvent(
                              params: ParamsGetListCustomerByRoute(
                                tbSalesRouteId: bloc.tbSalesRouteIdSelected,
                                tbRegionId: bloc.tbRegionIdSelected,
                                kind: bloc.kindSelected,
                                dtRecord: bloc.dtRecordSelected,
                              ),
                            ),
                          );
                        },
                        items: kindFilter
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: mediaquery.size.height - 141,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: widget.lista.isEmpty
                    ? const Center(
                        child: Text(
                            "Não encontramos nenhum registro em nossa base."))
                    : ListView.separated(
                        itemCount: widget.lista.length,
                        itemBuilder: (context, index) => InkWell(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  (widget.lista[index].sequence == 0)
                                      ? (Colors.red)
                                      : (Colors.black),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Text(
                                  (widget.lista[index].sequence > 0)
                                      ? (index + 1).toString()
                                      : '0',
                                  style: kCircleAvatarTextStyle,
                                ),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  widget.lista[index].nickTrade,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                                AutoSizeText(
                                  "End: ${widget.lista[index].street}, ${widget.lista[index].nmbr}",
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal),
                                  maxLines: 1,
                                ),
                                (widget.lista[index].complement
                                        .startsWith("https"))
                                    ? SizedBox(
                                        child: Link(
                                            uri: Uri.parse(widget
                                                .lista[index].complement
                                                .trim()),
                                            target: LinkTarget.blank,
                                            builder: (context, followLink) {
                                              return ElevatedButton(
                                                  style:
                                                      kElevatedButtonStyleRed,
                                                  onPressed: followLink,
                                                  child: const Text(
                                                    "Ver no mapa",
                                                    style:
                                                        kElevatedButtonTextStyle,
                                                  ));
                                            }),
                                      )
                                    : (widget
                                            .lista[index].complement.isNotEmpty)
                                        ? Text(
                                            "Comp: ${widget.lista[index].complement}",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.normal),
                                          )
                                        : const Text("")
                              ],
                            ),
                            trailing: BlocBuilder<AttendanceByRouteBloc,
                                AttendanceByRouteState>(
                              bloc: bloc,
                              builder: (context, state) {
                                if (state is CustomerListOrderState) {
                                  if (((bloc.tbCustomerIdPickedForOrder !=
                                          widget.lista[index].id)) ||
                                      (widget.lista[index].sequence == 0)) {
                                    return IconButton(
                                        icon: const Icon(Icons.check),
                                        onPressed: () {
                                          bloc.add(CustomerOrderedModeEvent(
                                              tbCustomerId: bloc
                                                  .tbCustomerIdPickedForOrder,
                                              tbSalesRouteId: widget
                                                  .lista[index].tbSalesRouteIid,
                                              sequence:
                                                  widget.lista[index].sequence +
                                                      1));
                                        });
                                  } else {
                                    return IconButton(
                                        icon: const Icon(Icons.block,
                                            color: kSecondaryColor),
                                        onPressed: () {});
                                  }
                                }
                                return IconButton(
                                  icon: const Icon(
                                      Icons.arrow_forward_ios_outlined),
                                  onPressed: () {
                                    OrderAttendanceModel orderAttemdance =
                                        OrderAttendanceModel(
                                      id: 0,
                                      tbInstitutionId: 0,
                                      tbUserId: 0,
                                      dtRecord: CustomDate.newDate(),
                                      tbCustomerId: widget.lista[index].id,
                                      nameCustomer:
                                          widget.lista[index].nickTrade,
                                      tbSalesmanId: 0,
                                      nameSalesman: "",
                                      tbPriceListId: 0,
                                      note: "",
                                      status: "A",
                                      visited: "S",
                                      charged: "N",
                                      recall: "N",
                                      finished: "N",
                                      longitude: "",
                                      latitude: "",
                                      routeRetorn:
                                          '/attendancesalesroute/mobile/',
                                      tbSalesRouteId:
                                          bloc.tbSalesRouteIdSelected,
                                      nameSalesRoute: bloc.salesRouteSelected,
                                      tbRegionId: bloc.tbRegionIdSelected,
                                      nameRegion: bloc.regionSelected,
                                    );
                                    Modular.to.navigate(
                                      '/attendance/',
                                      arguments: orderAttemdance,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          onDoubleTap: () {
                            bloc.add(
                              CustomerSetTurnBackEvent(
                                params: ParamsSetTurnBack(
                                  tbInstitutionId: 0,
                                  tbSalesRouteId: bloc.tbSalesRouteIdSelected,
                                  tbCustomerId: widget.lista[index].id,
                                  turnBack:
                                      (widget.lista[index].turnBack == 'S')
                                          ? "N"
                                          : "S",
                                ),
                              ),
                            );
                          },
                          onLongPress: () {
                            bloc.add(CustomerOrderModeEvent(
                                tbCustomerId: widget.lista[index].id));
                          },
                        ),
                        separatorBuilder: (_, __) => const Divider(),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
