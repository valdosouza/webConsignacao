import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';

class ContentConsignmentSupplying extends StatefulWidget {
  final OrderConsignmentSupplyingModel supplyingmodel;
  const ContentConsignmentSupplying({
    Key? key,
    required this.supplyingmodel,
  }) : super(key: key);

  @override
  State<ContentConsignmentSupplying> createState() =>
      _ContentConsignmentSupplyingState();
}

class _ContentConsignmentSupplyingState
    extends State<ContentConsignmentSupplying> {
  late TextEditingController editcontrol;
  late final OrderConsignmentRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderConsignmentRegisterModule>;
    });

    bloc = Modular.get<OrderConsignmentRegisterBloc>();
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              bloc.add(OrderConsignementRegisterSupplyngPostEvent(
                  suplyingmode: widget.supplyingmodel));
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
                buildListView(widget.supplyingmodel.items, size),
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
          switch (position) {
            case 0:
              widget.supplyingmodel.items[index].bonus = double.parse(value);
              break;
            case 1:
              widget.supplyingmodel.items[index].nameProduct = value;
              break;
            case 2:
              widget.supplyingmodel.items[index].leftover = double.parse(value);
              break;
            case 3:
              widget.supplyingmodel.items[index].devolution =
                  double.parse(value);
              break;
            case 4:
              widget.supplyingmodel.items[index].newConsignment =
                  double.parse(value);
              widget.supplyingmodel.items[index].qtyConsigned =
                  double.parse(value);
              break;
          }
          setState(() {
            widget.supplyingmodel.items;
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
            child: _headerField('Dívida Anterior'),
          ),
          Expanded(
            flex: 2,
            child: _listField(
                bloc.modelSupplying.order.currentDebitBalance.toString(),
                false,
                0,
                0),
          ),
        ],
      ),
    );
  }

  buildListView(List<OrderConsignmentSupplyingItemsModel> items, Size size) {
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
                      child: _listField(
                          items[index].bonus.toString(), true, index, 0),
                    ),
                    Expanded(
                      flex: 500,
                      child:
                          _listField(items[index].nameProduct, false, index, 1),
                    ),
                    Expanded(
                      flex: 200,
                      child: _listField(
                          items[index].leftover.toString(), false, index, 2),
                    ),
                    Expanded(
                      flex: 300,
                      child: _listField(
                          items[index].devolution.toString(), true, index, 3),
                    ),
                    Expanded(
                      flex: 315,
                      child: _listField(items[index].newConsignment.toString(),
                          true, index, 4),
                    ),
                    Expanded(
                      flex: 300,
                      child: _listField(items[index].qtyConsigned.toString(),
                          false, index, 5),
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
