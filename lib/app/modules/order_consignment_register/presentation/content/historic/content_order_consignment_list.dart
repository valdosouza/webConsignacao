import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';

class ContentOrderConsignmentList extends StatefulWidget {
  final List<OrderConsignmetListModel> orderList;
  const ContentOrderConsignmentList({
    Key? key,
    required this.orderList,
  }) : super(key: key);

  @override
  State<ContentOrderConsignmentList> createState() =>
      _ContentOrderConsignmentListState();
}

class _ContentOrderConsignmentListState
    extends State<ContentOrderConsignmentList> {
  late OrderConsignmentRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderConsignmentRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderConsignmentRegisterModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Sistema Consignação e Venda"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            switch (bloc.stage) {
              case 0:
                bloc.add(ReturnToCheckpointEvent());
                break; // The switch statement must be told to exit, or it will execute every case.
              case 1:
                bloc.add(ReturnToSupplyingEvent());
                break;
              case 2:
                bloc.add(ReturnToAttendanceEvent());
            }
          },
        ),
      ),
      body: Column(
        children: [
          buildSearchInput(),
          buildContentOrderList(),
        ],
      ),
    );
  }

  buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              initialValue: bloc.dateSelected,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  bloc.dateSelected = value;
                } else {
                  bloc.dateSelected = "";
                }
              },
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: "Pesquise por dia",
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              hoverColor: Colors.transparent,
              onPressed: () {
                bloc.add(SearchEvent(search: bloc.dateSelected));
              },
              icon: const Icon(
                Icons.search,
                //size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildTittleOrderList() {
    return Container(
      color: Theme.of(context).primaryColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Text("Data",
                    style: TextStyle(fontSize: 16, color: Colors.white))),
            Expanded(
                flex: 1,
                child: Text("Número",
                    style: TextStyle(fontSize: 16, color: Colors.white))),
          ],
        ),
      ),
    );
  }

  Widget buildContentOrderList() {
    final Size size = MediaQuery.of(context).size;
    return widget.orderList.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.height - 149,
              child: ListView.separated(
                itemCount: widget.orderList.length,
                itemBuilder: (context, index) => ListTile(
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
                      Text(widget.orderList[index].dtRecord),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: () {
                      bloc.add(
                        GetCheckpoint(
                          orderid: widget.orderList[index].id,
                        ),
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
