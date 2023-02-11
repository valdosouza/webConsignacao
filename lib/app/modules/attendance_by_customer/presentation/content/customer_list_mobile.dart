import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/attendance_by_customer/attendance_by_customer_module.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_bloc.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerListMobile extends StatefulWidget {
  const CustomerListMobile({
    Key? key,
    required this.lista,
  }) : super(key: key);
  final List<CustomerListModel> lista;
  @override
  State<CustomerListMobile> createState() => CustomerListeMobileState();
}

class CustomerListeMobileState extends State<CustomerListMobile> {
  late final AttendanceByCustomerBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AttendanceByCustomerBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceByCustomerModule>();
    });
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
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: (Colors.black),
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Modular.to.navigate(
                          '/attendancecustomer/mobile/register/edit/customer-register/',
                          arguments: widget.lista[index].id,
                        );
                      },
                    ),
                  ),
                  title: Text(widget.lista[index].nameCompany),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: () {
                      OrderAttendanceModel orderAttemdance =
                          OrderAttendanceModel(
                        id: 0,
                        tbInstitutionId: 0,
                        tbUserId: 0,
                        dtRecord: CustomDate.newDate(),
                        tbCustomerId: widget.lista[index].id,
                        nameCustomer: widget.lista[index].nameCompany,
                        tbSalesmanId: 0,
                        nameSalesman: "",
                        tbPriceListId: 0,
                        note: "",
                        status: "A",
                        visited: "S",
                        charged: "N",
                        recall: "N",
                        longitude: "",
                        latitude: "",
                      );
                      Modular.to.navigate(
                        '/attendance/',
                        arguments: orderAttemdance,
                      );
                    },
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(),
              ),
      ),
    );
  }
}
