import 'package:appweb/app/modules/order_attendance_register/data/datasource/order_attendance_datasource.dart';
import 'package:appweb/app/modules/order_attendance_register/data/datasource/order_consignment_supplying_datasource.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendance_register/data/repository/order_attendance_repository.dart';
import 'package:appweb/app/modules/order_attendance_register/data/repository/order_consignment_supplying_repository.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/custom_input.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/order_attendance_checkppoint_page.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/order_attendance_supplying_page.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/price_list_model.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/theme.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/utils/verify_check_point.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PriceListModel> prices = [];
  TextEditingController fieldTextNote = TextEditingController();

  OrderAttendanceRepositoryImpl orderAttendanceRepository =
      OrderAttendanceRepositoryImpl(
          dataSource: OrderAttendanceDataSourceImpl());

  @override
  Widget build(BuildContext context) {
    prices.clear;
    prices.add(
      PriceListModel(
        active: "S",
        aliqProfit: 0,
        description: "Consignado",
        id: 1,
        modality: "A",
        tbInstitutionId: 1,
      ),
    );
    prices.add(
      PriceListModel(
        active: "S",
        aliqProfit: 0,
        description: "Boleto",
        id: 1,
        modality: "A",
        tbInstitutionId: 1,
      ),
    );
    prices.add(
      PriceListModel(
        active: "S",
        aliqProfit: 0,
        description: "À Vista",
        id: 1,
        modality: "A",
        tbInstitutionId: 1,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Mercado do Povo -(A4"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomInput(
                title: 'Data',
                initialValue:
                    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                keyboardType: TextInputType.datetime,
                inputAction: TextInputAction.next,
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: prices.length,
                  itemBuilder: (context, index) => InkWell(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Text((index + 1).toString()),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(prices[index].description),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () async {
                          Future<bool> check =
                              VerifyCheckPoint.verifyCheckPoint(id: 1);
                          if (await check) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrderAttendanceCheckpointPage(
                                        title: "Mercado do Povo"),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrderAttendanceSupplyingPage(
                                        title: "Mercado do Povo"),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => const Divider(),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () => {
                      orderAttendanceRepository
                          .createAttendance(OrderAttendanceModel(
                        id: 0,
                        tbInstitutionId:
                            1, //acredito que ao acessar essa tela, o sistema já deve saber qual é a instituição
                        tbUserId: 0, //acredito que seja o usuário logado
                        tbCustomerId: 0,
                        nameCustomer: '',
                        tbSalesmanId: 0,
                        nameSalesman: '',
                        dtRecord: '',
                        note: fieldTextNote.text,
                        status: '',
                        visited: '',
                        charged: '',
                        latitude: '',
                        longitude: '',
                      )),
                      //Redireciona para a rota base
                    },
                    child: Column(
                      children: const <Widget>[
                        Icon(Icons.access_alarms_sharp),
                        Text("Somente Registrar o Atendimento")
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomInput(
                controller: fieldTextNote,
                title: 'Observação',
                keyboardType: TextInputType.multiline,
                inputAction: TextInputAction.next,
                onChanged: (value) {},
                minLines: 4,
                maxLines: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
