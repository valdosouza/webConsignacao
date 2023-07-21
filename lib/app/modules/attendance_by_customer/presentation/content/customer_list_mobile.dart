import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/attendance_by_customer/attendance_by_customer_module.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_bloc.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_event.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/link.dart';

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
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSearchInput(),
          SizedBox(
            height: size.height - 133,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: widget.lista.isEmpty
                  ? const Center(
                      child: Text(
                          "Não encontramos nenhum registro em nossa base."))
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
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              widget.lista[index].nickTrade,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                            AutoSizeText(
                              "End: ${widget.lista[index].street}, ${widget.lista[index].nmbr}",
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal),
                              maxLines: 1,
                            ),
                            (widget.lista[index].complement.startsWith("https"))
                                ? SizedBox(
                                    child: Link(
                                        uri: Uri.parse(widget
                                            .lista[index].complement
                                            .trim()),
                                        target: LinkTarget.blank,
                                        builder: (context, followLink) {
                                          return ElevatedButton(
                                              onPressed: followLink,
                                              child: const Text("Ver no mapa"));
                                        }),
                                  )
                                : (widget.lista[index].complement.isNotEmpty)
                                    ? Text(
                                        "Comp: ${widget.lista[index].complement}",
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal),
                                      )
                                    : const Text("")
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
                              routeRetorn: '/attendancecustomer/mobile/',
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
          ),
        ],
      ),
    );
  }

  Container _buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        onChanged: (value) {
          bloc.add(CustomerSearchEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise de cliente por nome",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
