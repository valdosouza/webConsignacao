

import 'package:appweb/app/modules/order_attendance_register/presentation/pages/payment_list_model.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuxiliarPage extends StatefulWidget {
  const AuxiliarPage({super.key, required this.title});

  final String title;

  @override
  State<AuxiliarPage> createState() => AuxiliarPageSate();
}

class AuxiliarPageSate extends State<AuxiliarPage> {
  List<PaymentListModel> items = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    items.clear();
    items.add(
      PaymentListModel(
        description: "Dinheiro",
        value: "40,00",
      ),
    );
    items.add(
      PaymentListModel(
        description: "Pix",
        value: "0,00",
      ),
    );
    items.add(
      PaymentListModel(
        description: "Troco",
        value: "0,00",
      ),
    );
    items.add(
      PaymentListModel(
        description: "Saldo Devedor",
        value: "40,00",
      ),
    );
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Mercado do Povo"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_box),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _generalInfo(),
            ),
            Expanded(
              flex: 1,
              child: _paymentInfo(),
            ),
          ],
        ),
      ),
    );
  }

  _generalInfo() {
    return Container(
      alignment: Alignment.center,
      margin:
          const EdgeInsets.only(left: 3.0, top: 4.0, right: 2.0, bottom: 20.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Último Acerto : 01/12/2022"),
          Text("Próximo Acerto : 08/12/2022"),
        ],
      ),
    );
  }

  _paymentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(3.0),
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
          //padding: const EdgeInsets.all(3.0),
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
        _paymentInfoSaldoDevedor()
      ],
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

  _listField(String description) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      margin:
          const EdgeInsets.only(left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
      //padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        description,
        textAlign: TextAlign.center,
      ),
    );
  }

  buildListView(List<PaymentListModel> items) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: items.isEmpty
            ? const Center(
                child: Text("Não encontramos nenhum registro em nossa base."))
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 0,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) => ListTile(
                  title: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: _listField(items[index].description),
                          ),
                          Expanded(
                            flex: 1,
                            child: _listField(items[index].value),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
