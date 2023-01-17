import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_production/presentation/page/order_production_page.dart';
import 'package:appweb/app/modules/order_production_register/order_production_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderProductionModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/content/',
      child: (_, args) => const OrderProductionPage(),
      children: [
        ModuleRoute('/order/', module: OrderProductionRegisterModule()),
      ],
    ),
  ];
}
