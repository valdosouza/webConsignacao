import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_checkpoint_model.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_bloc.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_event.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/pages/order_attendance_supplying_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderAttendanceCheckpointPage extends StatefulWidget {
  const OrderAttendanceCheckpointPage({super.key});

  @override
  State<OrderAttendanceCheckpointPage> createState() =>
      _OrderAttendanceCheckpointPageState();
}

class _OrderAttendanceCheckpointPageState
    extends State<OrderAttendanceCheckpointPage> {
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
            icon: const Icon(Icons.check),
            onPressed: () {
              bloc.modelCheckpoint.order.debitBalance = (bloc
                              .modelCheckpoint.items
                              .map((e) =>
                                  ((e.qtyConsigned - e.leftover) * e.unitValue))
                              .reduce((value, element) => value + element) +
                          bloc.modelCheckpoint.order.debitBalance -
                          bloc.modelCheckpoint.payments[0].value -
                          bloc.modelCheckpoint.payments[1].value) >
                      0
                  ? (bloc.modelCheckpoint.items
                          .map((e) =>
                              ((e.qtyConsigned - e.leftover) * e.unitValue))
                          .reduce((value, element) => value + element) +
                      bloc.modelCheckpoint.order.debitBalance -
                      bloc.modelCheckpoint.payments[0].value -
                      bloc.modelCheckpoint.payments[1].value)
                  : 0.0;

              bloc.add(OrderAttendanceRegisterCheckpointPostEvent(
                  bloc.modelCheckpoint));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderAttendanceSupplyingPage(),
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    buildListView(bloc.modelCheckpoint.items, size),
                    const SizedBox(height: 5.00),
                    _footter(),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: _paymentInfo(),
              ),
            ],
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
            flex: 200,
            child: _headerField('Descrição'),
          ),
          Expanded(
            flex: 500,
            child: _headerField('Quantidade Consignada'),
          ),
          Expanded(
            flex: 200,
            child: _headerField('Sobra'),
          ),
          Expanded(
            flex: 315,
            child: _headerField('Quantidade Vendida'),
          ),
          Expanded(
            flex: 300,
            child: _headerField('Valor por Produto'),
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

  _listField(String description, bool enabled, int index) {
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
          if (value.isNotEmpty) {
            value.isNotEmpty
                ? bloc.modelCheckpoint.items[index].leftover = int.parse(value)
                : bloc.modelCheckpoint.items[index].leftover = 0;
            setState(() {
              bloc;
            });
          }
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
            child: _headerField('Divida Velha'),
          ),
          Expanded(
            flex: 2,
            child: _listField(
                bloc.modelCheckpoint.order.debitBalance.toString(), false, 0),
          ),
          Expanded(
            flex: 2,
            child: _listField(
                bloc.modelCheckpoint.items
                    .map((e) => ((e.qtyConsigned - e.leftover) * e.unitValue))
                    .reduce((value, element) => value + element)
                    .toString(),
                false,
                0),
          ),
        ],
      ),
    );
  }

  _paymentInfo() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.black,
            ),
            child: const Text(
              "Total a Pagar",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              (bloc.modelCheckpoint.items
                          .map((e) =>
                              ((e.qtyConsigned - e.leftover) * e.unitValue))
                          .reduce((value, element) => value + element) +
                      bloc.modelCheckpoint.order.debitBalance)
                  .toString(),
              textAlign: TextAlign.center,
            ),
          ),
          _paymentInfoDinheiro(),
          _paymentInfoPix(),
          _paymentInfoTroco(),
          const SizedBox(height: 7.00),
          _paymentInfoSaldoDevedor()
        ],
      ),
    );
  }

  _paymentInfoDinheiro() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              "Dinheiro",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: TextEditingController(
                  text: bloc.modelCheckpoint.payments[0].value.toString()),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onSubmitted: (value) {
                bloc.modelCheckpoint.payments[0].value = double.parse(value);
                setState(() {
                  bloc;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  _paymentInfoPix() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              "Pix",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: TextEditingController(
                  text: bloc.modelCheckpoint.payments[1].value.toString()),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onSubmitted: (value) {
                bloc.modelCheckpoint.payments[1].value = double.parse(value);
                setState(() {
                  bloc;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  _paymentInfoTroco() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              "Troco",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              (bloc.modelCheckpoint.items
                              .map((e) =>
                                  ((e.qtyConsigned - e.leftover) * e.unitValue))
                              .reduce((value, element) => value + element) +
                          bloc.modelCheckpoint.order.debitBalance -
                          bloc.modelCheckpoint.payments[0].value -
                          bloc.modelCheckpoint.payments[1].value) <
                      0
                  ? (bloc.modelCheckpoint.items
                              .map((e) =>
                                  ((e.qtyConsigned - e.leftover) * e.unitValue))
                              .reduce((value, element) => value + element) +
                          bloc.modelCheckpoint.order.debitBalance -
                          bloc.modelCheckpoint.payments[0].value -
                          bloc.modelCheckpoint.payments[1].value)
                      .toString()
                  : "0.00",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  _paymentInfoSaldoDevedor() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              "Saldo Devedor",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              (bloc.modelCheckpoint.items
                              .map((e) =>
                                  ((e.qtyConsigned - e.leftover) * e.unitValue))
                              .reduce((value, element) => value + element) +
                          bloc.modelCheckpoint.order.debitBalance -
                          bloc.modelCheckpoint.payments[0].value -
                          bloc.modelCheckpoint.payments[1].value) >
                      0
                  ? (bloc.modelCheckpoint.items
                              .map((e) =>
                                  ((e.qtyConsigned - e.leftover) * e.unitValue))
                              .reduce((value, element) => value + element) +
                          bloc.modelCheckpoint.order.debitBalance -
                          bloc.modelCheckpoint.payments[0].value -
                          bloc.modelCheckpoint.payments[1].value)
                      .toString()
                  : "0.00",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  buildListView(List<OrderAttendanceCheckpointItemsModel> items, Size size) {
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
                          items[index].bonus.toString(), false, index),
                    ),
                    Expanded(
                      flex: 200,
                      child: _listField(
                          items[index].tbProductId.toString(), false, index),
                    ),
                    Expanded(
                      flex: 500,
                      child: _listField(
                          items[index].qtyConsigned.toString(), false, index),
                    ),
                    Expanded(
                      flex: 200,
                      child: _listField(
                          items[index].leftover.toString(), true, index),
                    ),
                    Expanded(
                      flex: 315,
                      child: _listField(
                          (items[index].qtyConsigned - items[index].leftover)
                              .toString(),
                          false,
                          index),
                    ),
                    Expanded(
                      flex: 300,
                      child: _listField(
                          items[index].unitValue.toString(), false, index),
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
