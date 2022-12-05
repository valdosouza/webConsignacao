import 'package:appweb/app/modules/collaborator_register/collaborator_register_module.dart';
import 'package:appweb/app/modules/line_business_register/linebusiness_register_module.dart';
import 'package:appweb/app/modules/resource_human/presentation/pages/resource_human_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResourceHumanModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/content/',
      child: (_, args) => const ResourceHumanPage(),
      children: [
        ModuleRoute('/lineBusiness/', module: LinebusinessRegisterModule()),
        ModuleRoute('/collaborator/', module: CollaboratorRegisterModule()),
      ],
    ),
  ];
}
