

import 'package:appweb/app/modules/order_attendance_register/presentation/pages/order_attendance_checkppoint_page.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/order_attendance_supplying_page.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/product_list_model.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/theme.dart';
import 'package:flutter/material.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key, required this.title});

  final String title;

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  List<ProductListModel> items = [];
  late TextEditingController editcontrol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Iniciar Atendimento"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const OrderAttendanceCheckpointPage(
                                  title: "Mercado do Povo"),
                        ),
                      )
                    },
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: const <Widget>[
                        Icon(Icons.add),
                        Text("Efetuar ChekPoint")
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const OrderAttendanceSupplyingPage(
                                  title: "Mercado do Povo"),
                        ),
                      )
                    },
                    child: Column(
                      children: const <Widget>[
                        Icon(Icons.add),
                        Text("Efetuar Supplying")
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
