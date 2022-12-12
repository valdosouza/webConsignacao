import 'dart:convert';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/attendance_sales_route/attendance_sales_route_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class AttendanceSalesRoutePageMobile extends StatefulWidget {
  const AttendanceSalesRoutePageMobile({super.key});

  @override
  State<AttendanceSalesRoutePageMobile> createState() =>
      AttendanceSalesRoutePageMobileState();
}

class SalesRoute {
  int id;
  int tb_institution_id;
  String description;
  String active;

  SalesRoute({
    required this.id,
    required this.tb_institution_id,
    required this.description,
    required this.active,
  });

  factory SalesRoute.fromJson(Map<String, dynamic> json) => SalesRoute(
        id: json["id"],
        tb_institution_id: json["tb_institution_id"],
        description: json["description"],
        active: json["active"],
      );
}

Future<List<SalesRoute>> getSalesRoute() async {
  final response = await http.get(
    Uri.parse(
        'https://api.industriadechocolatesamor.com.br/salesroute/getlist/1'),
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    List<SalesRoute> salesroute = [];
    return salesroute;
  } else {
    throw Exception('Failed ');
  }
}
// const baseUrl = "https://api.industriadechocolatesamor.com.br/doc ";

// class API {
//   static Future getSalesRoute() {
//     var url = "$baseUrl/SalesRoute";
//     return http.get(url);
//   }
// }

class AttendanceSalesRoutePageMobileState
    extends State<AttendanceSalesRoutePageMobile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceSalesRouteModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Sistema Consignação e Venda"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            //Modular.to.pop();
            //Navigator.of(context).pop();
            Modular.to.navigate('/customer/mobile/');
          },
        ),
      ),
      // Tela alteração
      body: Center(
        child: FutureBuilder<List<SalesRoute>>(
            future: getSalesRoute(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // title: Text(snapshot.data![index].tb_institution_id),
                        subtitle: Text(snapshot.data![index].description),
                        trailing: Text(snapshot.data![index].active),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
    // SizedBox(
    //   height: size.height,
    //   width: size.width,
    //   child:
    //       const Center(child: Text("Atendimento por Rota de Venda - Mobile")),
    // ),
  }
}
