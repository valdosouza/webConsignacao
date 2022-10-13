import 'package:appweb/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    GlobalKey<NavigatorState>? navigatorKey;
    Modular.setNavigatorKey(navigatorKey);
    return FutureBuilder(
        future: Modular.isModuleReady<AppModule>(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(home: Container());
          } else {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Sistema de Consignação e Venda',
              theme: ThemeData(
                primarySwatch: Colors.red,
              ),
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
            );
          }
        });
  }
}
