import 'package:appweb/app/modules/customer/presentation/pages/customer_page.dart';
import 'package:appweb/app/modules/customer_register/customer_register_module.dart';
import 'package:appweb/app/modules/customer_register/presentation/pages/customer_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/desktop/',
      child: (_, args) => const CustomerPage(),
      children: [
        ModuleRoute('/customer-register/', module: CustomerRegisterModule()),
      ],
    ),
    ChildRoute(
      '/mobile/',
      child: (_, args) => const CustomerRegisterPage(),
      children: [
        ModuleRoute('/customer-register/', module: CustomerRegisterModule()),
      ],
    ),
  ];
}
