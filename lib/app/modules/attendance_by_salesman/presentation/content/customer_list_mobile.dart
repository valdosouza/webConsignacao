import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: widget.lista.isEmpty
            ? const Center(
                child: Text("Não encontramos nenhum dado em nossa base."))
            : ListView.separated(
                itemCount: widget.lista.length,
                itemBuilder: (context, index) => InkWell(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (Colors.black),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Text(
                          (widget.lista[index].id).toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.lista[index].nameCompany),
                      ],
                    ),
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
                ),
                separatorBuilder: (_, __) => const Divider(),
              ),
      ),
    );
  }
}
