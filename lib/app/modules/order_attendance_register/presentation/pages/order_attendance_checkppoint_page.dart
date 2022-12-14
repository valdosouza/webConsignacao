import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_check_point_items_model.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/product_list_model.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/theme.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/utils/product_list_order_attendance_check_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderAttendanceCheckpointPage extends StatefulWidget {
  const OrderAttendanceCheckpointPage({super.key, required this.title});

  final String title;

  @override
  State<OrderAttendanceCheckpointPage> createState() =>
      _OrderAttendanceCheckpointPageState();
}

class _OrderAttendanceCheckpointPageState
    extends State<OrderAttendanceCheckpointPage> {
  List<OrderConsignmentCheckPointItemsModel> items = [];
  late TextEditingController editcontrol;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    initializeItems();
  }

  initializeItems() async {
    items = await ProductListOrderAttendanceCheckPoint.products(id: 1);
    setState(() {
      items;
    });
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
                    buildListView(items, size),
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
            flex: 500,
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
            child: _headerField('Valor por produto'),
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

  _listField(String description, bool isEditable) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      margin:
          const EdgeInsets.only(left: 3.0, top: 0.0, right: 3.0, bottom: 0.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        enabled: isEditable,
        controller: TextEditingController(text: description),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
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
            child: _listField('0,00', false),
          ),
          Expanded(
            flex: 2,
            child: _listField('0,00', false),
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
            child: const Text(
              "43,75",
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
            child: const Text(
              "40,00",
              textAlign: TextAlign.center,
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
            child: const Text(
              "0,00",
              textAlign: TextAlign.center,
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
            child: const Text(
              "0,00",
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
            child: const Text(
              "3,75",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  buildListView(List<OrderConsignmentCheckPointItemsModel> items, Size size) {
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
                      child: _listField(items[index].bonus.toString(), false),
                    ),
                    Expanded(
                      flex: 500,
                      child: _listField(items[index].nameProduct, false),
                    ),
                    Expanded(
                      flex: 500,
                      child: _listField(items[index].qtyConsigned.toString(), false),
                    ),
                    Expanded(
                      flex: 200,
                      child: _listField(items[index].leftover.toString(), true),
                    ),
                    Expanded(
                      flex: 315,
                      child: _listField((items[index].qtyConsigned - items[index].leftover).toString(), false),
                    ),
                    Expanded(
                      flex: 300,
                      child: _listField((items[index].qtyConsigned - items[index].leftover).toString(), false),
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
