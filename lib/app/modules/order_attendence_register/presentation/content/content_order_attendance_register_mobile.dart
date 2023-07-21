import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_bloc.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_event.dart';

class ContentOrderAttendanceRegisterMobile extends StatefulWidget {
  const ContentOrderAttendanceRegisterMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentOrderAttendanceRegisterMobile> createState() =>
      _ContentOrderAttendanceRegisterMobileState();
}

class _ContentOrderAttendanceRegisterMobileState
    extends State<ContentOrderAttendanceRegisterMobile> {
  TextEditingController editcontrol = TextEditingController();
  late final OrderAttendanceRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderAttendanceRegisterBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomInput(
              title: 'Data',
              initialValue: CustomDate.newDate(),
              keyboardType: TextInputType.datetime,
              inputAction: TextInputAction.next,
              onChanged: (value) {},
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: bloc.pricelist.length,
                itemBuilder: (context, index) => InkWell(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (Colors.black),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Text(bloc.pricelist[index].id.toString()),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bloc.pricelist[index].description),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right),
                      onPressed: () async {
                        bloc.orderAttendance.visited = 'S';
                        bloc.orderAttendance.note = editcontrol.text;
                        bloc.orderAttendance.tbPriceListId =
                            bloc.pricelist[index].id;
                        if (bloc.orderAttendance.id == 0) {
                          bloc.add(OrderAttendanceRegisterPostEvent());
                        } else {
                          bloc.add(OrderAttendanceRegisterPutEvent());
                        }
                      },
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(),
              ),
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                    backgroundColor: kButtonColor,
                  ),
                  onPressed: () {
                    bloc.orderAttendance.note = editcontrol.text;
                    bloc.orderAttendance.tbPriceListId = 0;
                    bloc.orderAttendance.finished = "S";
                    bloc.add(OrderAttendanceRegisterPostEvent());
                  },
                  child: const Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      Icon(Icons.access_alarms_sharp),
                      Text("Somente Registrar o Atendimento"),
                      SizedBox(height: 15),
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
    );
  }
}
