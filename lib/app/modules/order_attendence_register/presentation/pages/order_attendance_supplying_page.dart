import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_supplying_model.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_bloc.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_event.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/widgets/product_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderAttendanceSupplyingPage extends StatefulWidget {
  const OrderAttendanceSupplyingPage({super.key});

  @override
  State<OrderAttendanceSupplyingPage> createState() =>
      _OrderAttendanceSupplyingPageState();
}

class _OrderAttendanceSupplyingPageState
    extends State<OrderAttendanceSupplyingPage> {
  List<ProductListModel> items = [];
  late TextEditingController editcontrol;
  late final OrderAttendanceRegisterBloc bloc;
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    bloc = Modular.get<OrderAttendanceRegisterBloc>();

    items.clear();
    items.add(
      ProductListModel(
        bonus: "0",
        desciption: "choim amendoin",
        sobra: "22",
        devolucao: "22",
        newConsignation: '32',
        qttyConsignation: '32',
      ),
    );
    
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Mercado do Povo"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.cleaning_services),
            onPressed: () {
              bloc.add(OrderAttendanceRegisterSupplyingGetlastEvent(1, 1));
            },
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              for (var item in items){
                bloc.modelSupplying.items.add(
                    OrderAttendanceSupplyingItemsModel(
                      bonus: int.parse(item.bonus),
                      devolution: int.parse(item.devolucao),
                      qtyConsigned: int.parse(item.qttyConsignation),
                      nameProduct: 1,
                      newConsignment: int.parse(item.newConsignation),
                      leftover: int.parse(item.sobra),
                      tbProductId: 1,
                    )
                  ); 
              }              
              bloc.add(OrderAttendanceRegisterPostSupplyingEvent(bloc.modelSupplying));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Center(
          child: Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildListView(items, size),
                const SizedBox(height: 5.00),
                _footter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      alignment: Alignment.center,
      margin:
          const EdgeInsets.only(left: 1.0, top: 0.0, right: 1.0, bottom: 0.0),
      child: Row(
        children: [
          Expanded(
            flex: 200,
            child: _headerField('Bonus'),
          ),
          Expanded(
            flex: 500,
            child: _headerField('Descrição'),
          ),
          Expanded(
            flex: 200,
            child: _headerField('Sobra'),
          ),
          Expanded(
            flex: 300,
            child: _headerField('Devolução'),
          ),
          Expanded(
            flex: 315,
            child: _headerField('Nova Consignação'),
          ),
          Expanded(
            flex: 300,
            child: _headerField('Quantidade Consignada'),
          ),
        ],
      ),
    );
  }

  _headerField(String description) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.black,
      ),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  _listField(String description, bool enabled, int index, int position) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      margin:
          const EdgeInsets.only(left: 3.0, top: 0.0, right: 3.0, bottom: 0.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        enabled: enabled,
        controller: TextEditingController(text: description),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onSubmitted: (value) {
          if (position == 0) {
            items[index].bonus = value;
          } else if (position == 1) {
            items[index].desciption = value;
          } else if (position == 2) {
            items[index].sobra = value;
          } else if (position == 3) {
            items[index].devolucao = value;
            items[index].sobra = (int.parse(items[index].qttyConsignation) - int.parse(items[index].devolucao)).toString();
          } else if (position == 4) {
            items[index].newConsignation = value;
          } else if (position == 5) {
            items[index].qttyConsignation = value;
          }
          setState(() {
            items;
          });
        },
      ),
    );
  }

  Widget _footter() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      margin:
          const EdgeInsets.only(left: 1.0, top: 0.0, right: 1.0, bottom: 0.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: _headerField('Divida Anterior'),
          ),
          Expanded(
            flex: 2,
            child: _listField(bloc.modelCheckpoint.order.debitBalance.toString(), false, 0,0),
          ),
        ],
      ),
    );
  }

  buildListView(List<ProductListModel> items, Size size) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      margin: const EdgeInsets.only(left: 3.0, right: 2.0),
      child: Column(
        children: [
          _header(),
          SizedBox(
            height: size.height - 190,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 200,
                      child: _listField(items[index].bonus, true, index, 0),
                    ),
                    Expanded(
                      flex: 500,
                      child: _listField(items[index].desciption, false, index, 1),
                    ),
                    Expanded(
                      flex: 200,
                      child: _listField(items[index].sobra, false, index, 2),
                    ),
                    Expanded(
                      flex: 300,
                      child: _listField(items[index].devolucao, true, index, 3),
                    ),
                    Expanded(
                      flex: 315,
                      child: _listField(items[index].newConsignation, true, index, 4),
                    ),
                    Expanded(
                      flex: 300,
                      child: _listField(items[index].qttyConsignation, false, index, 5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
