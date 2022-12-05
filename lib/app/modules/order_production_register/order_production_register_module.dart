import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_production_register/presentation/pages/order_production_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderProductionRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const OrderProductionRegisterPage(),
    ),
  ];
}
