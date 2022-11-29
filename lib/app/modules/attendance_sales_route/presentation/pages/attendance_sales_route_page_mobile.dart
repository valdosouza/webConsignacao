import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/attendance_sales_route/attendance_sales_route_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceSalesRoutePageMobile extends StatefulWidget {
  const AttendanceSalesRoutePageMobile({super.key});

  @override
  State<AttendanceSalesRoutePageMobile> createState() =>
      AttendanceSalesRoutePageMobileState();
}

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
            Modular.to.navigate('/customer/content/');
          },
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child:
            const Center(child: Text("Atendimento por Rota de Venda - Mobile")),
      ),
    );
  }
}
