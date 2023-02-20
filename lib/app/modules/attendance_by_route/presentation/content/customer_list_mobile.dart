import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_event.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_state.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: widget.lista.isEmpty
            ? const Center(
                child: Text("Não encontramos nenhum registro em nossa base."))
            : ListView.separated(
                itemCount: widget.lista.length,
                itemBuilder: (context, index) => InkWell(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (widget.lista[index].sequence == 0)
                          ? (Colors.red)
                          : (Colors.black),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Text(
                          (widget.lista[index].sequence > 0)
                              ? (index + 1).toString()
                              : '0',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.lista[index].nickTrade),
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
                                      tbCustomerId:
                                          bloc.tbCustomerIdPickedForOrder,
                                      tbSalesRouteId:
                                          widget.lista[index].tbSalesRouteIid,
                                      sequence:
                                          widget.lista[index].sequence + 1));
                                });
                          } else {
                            return IconButton(
                                icon: const Icon(Icons.block),
                                onPressed: () {});
                          }
                        }
                        return IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                          onPressed: () {
                            OrderAttendanceModel orderAttemdance =
                                OrderAttendanceModel(
                              id: 0,
                              tbInstitutionId: 0,
                              tbUserId: 0,
                              dtRecord: CustomDate.newDate(),
                              tbCustomerId: widget.lista[index].id,
                              nameCustomer: widget.lista[index].nickTrade,
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
                              routeRetorn: '/attendancesalesroute/mobile/',
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
                  onLongPress: () {
                    bloc.add(CustomerOrderModeEvent(
                        tbCustomerId: widget.lista[index].id));
                  },
                ),
                separatorBuilder: (_, __) => const Divider(),
              ),
      ),
    );
  }
}
