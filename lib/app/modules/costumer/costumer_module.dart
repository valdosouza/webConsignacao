import 'package:appweb/app/modules/costumer/presentation/pages/costumer_page.dart';
import 'package:appweb/app/modules/customer_register/costumer_register_module.dart';
import 'package:appweb/app/modules/customer_register/presentation/pages/costumer_register.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CostumerModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CostumerPage(), children: [
      ChildRoute('/content/',
          child: (_, args) => const ContentCostumerRegister()),
      ModuleRoute('/content/customer-register/',
          module: CostumerRegisterModule()),
    ]),
  ];
}
