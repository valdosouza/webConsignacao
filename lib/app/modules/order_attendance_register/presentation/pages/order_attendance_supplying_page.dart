import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_supplying_items_model.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/theme.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/utils/product_list_order_attendance_supplying.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderAttendanceSupplyingPage extends StatefulWidget {
  const OrderAttendanceSupplyingPage({super.key, required this.title});

  final String title;

  @override
  State<OrderAttendanceSupplyingPage> createState() =>
      _OrderAttendanceSupplyingPageState();
}

class _OrderAttendanceSupplyingPageState
    extends State<OrderAttendanceSupplyingPage> {
  List<OrderConsignmentSupplyingItemsModel> items = [];
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
    items = await ProductListOrderAttendanceSupplying.products(id: 1);
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
            onPressed: () {},
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
            child: _headerField('Divida Anterior'),
          ),
          Expanded(
            flex: 2,
            child: _listField('0,00', false),
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
                      child: _listField(items[index].bonus.toString(), true),
                    ),
                    Expanded(
                      flex: 500,
                      child: _listField(items[index].nameProduct, false),
                    ),
                    Expanded(
                      flex: 200,
                      child: _listField(
                          items[index].qtyConsigned.toString(), false),
                    ),
                    Expanded(
                      flex: 300,
                      child: _listField(items[index].leftover.toString(), true),
                    ),
                    Expanded(
                      flex: 315,
                      child: _listField(
                          (items[index].qtyConsigned - items[index].leftover)
                              .toString(),
                          true),
                    ),
                    Expanded(
                      flex: 300,
                      child: _listField(
                          (items[index].qtyConsigned - items[index].leftover)
                              .toString(),
                          false),
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
