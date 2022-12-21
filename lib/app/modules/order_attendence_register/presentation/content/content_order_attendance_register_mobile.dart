import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_bloc.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_event.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';

class ContentOrderAttendanceRegisterMobile extends StatefulWidget {
  final List<PriceListModel> pricelist;
  final int tbCustomerId;
  const ContentOrderAttendanceRegisterMobile({
    Key? key,
    required this.tbCustomerId,
    required this.pricelist,
  }) : super(key: key);

  @override
  State<ContentOrderAttendanceRegisterMobile> createState() =>
      _ContentOrderAttendanceRegisterMobileState();
}

class _ContentOrderAttendanceRegisterMobileState
    extends State<ContentOrderAttendanceRegisterMobile> {
  late final OrderAttendanceModel orderAttendance;

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
                itemCount: widget.pricelist.length,
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
                        Text(widget.pricelist[index].description),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right),
                      onPressed: () async {
                        bloc.orderAttendance.visited = 'S';
                        bloc.orderAttendance.note = editcontrol.text;
                        bloc.add(OrderAttendanceRegisterPostEvent(
                            bloc.orderAttendance));
                        Modular.to.navigate('/consignment/');
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
                    bloc.add(
                        OrderAttendanceRegisterPostEvent(bloc.orderAttendance));
                    editcontrol.clear();
                    Modular.to.navigate('/customer/mobile/');
                  },
                  child: Column(
                    children: const <Widget>[
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
