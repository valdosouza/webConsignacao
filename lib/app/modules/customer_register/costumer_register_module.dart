import 'package:appweb/app/modules/customer_register/presentation/pages/costumer_register.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CostumerRegisterModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ContentCostumerRegister()),
  ];
}
