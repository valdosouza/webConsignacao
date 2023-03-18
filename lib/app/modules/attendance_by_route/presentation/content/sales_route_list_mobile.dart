import 'package:appweb/app/modules/attendance_by_route/attendance_by_route_module.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_event.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SalesRouteListMobile extends StatefulWidget {
  const SalesRouteListMobile({
    Key? key,
    required this.lista,
  }) : super(key: key);
  final List<SalesRouteListModel> lista;
  @override
  State<SalesRouteListMobile> createState() => SalesRoutListeMobileState();
}

class SalesRoutListeMobileState extends State<SalesRouteListMobile> {
  late final AttendanceByRouteBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AttendanceByRouteBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceByRouteModule>();
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
                itemBuilder: (context, index) => InkWell(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (Colors.black),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.lista[index].description),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                      onPressed: () {
                        bloc.tbSalesRouteIdSelected = widget.lista[index].id;
                        bloc.salesRouteSelected =
                            widget.lista[index].description;
                        bloc.add(CustomerGetListEvent());
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
