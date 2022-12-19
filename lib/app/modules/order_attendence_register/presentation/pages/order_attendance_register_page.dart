import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_supplying_model.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_bloc.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_event.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/pages/order_attendance_checkppoint_page.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/pages/order_attendance_supplying_page.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/widgets/custom_input.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderAttendanceRegisterPage extends StatefulWidget {
  const OrderAttendanceRegisterPage({super.key});

  @override
  State<OrderAttendanceRegisterPage> createState() =>
      _OrderAttendanceRegisterPageState();
}

class _OrderAttendanceRegisterPageState
    extends State<OrderAttendanceRegisterPage> {
  List<PriceListModel> prices = [];
  TextEditingController editcontrol = TextEditingController();
  late final OrderAttendanceRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderAttendanceRegisterBloc>();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  Future<bool> isVisited() async {
    bool visited = false;

    var getlast = await bloc.getlastSupplying(1, 1);
    if (getlast.isRight()) {
      getlast
          .getOrElse(() => OrderAttendanceSupplyingModel.isEmpty())
          .items
          .forEach((element) {
        if (element.bonus > 0 || element.qtyConsigned > 0) {
          visited = true;
          bloc.add(OrderAttendanceRegisterSupplyingGetlastEvent(1, 70));
        }
      });
    }
    return visited;
  }

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
        title: const Text("Mercado do Povo -(A4)"),
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
                    '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
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
                          bloc.modelAttendance.visited = 'S';
                          bloc.modelAttendance.note = editcontrol.text;
                          bloc.add(OrderAttendanceRegisterPostEvent(
                              bloc.modelAttendance));

                          if (await isVisited()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrderAttendanceCheckpointPage(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrderAttendanceSupplyingPage(),
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
                      bloc.modelAttendance.note = editcontrol.text,
                      bloc.add(OrderAttendanceRegisterPostEvent(
                          bloc.modelAttendance)),
                      editcontrol.clear(),
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
                controller: editcontrol,
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
