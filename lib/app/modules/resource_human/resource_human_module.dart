import 'package:appweb/app/modules/collaborator/collaborator_module.dart';
import 'package:appweb/app/modules/collaborator_register/collaborator_register_module.dart';
import 'package:appweb/app/modules/line_business_register/line_business_register_module.dart';
import 'package:appweb/app/modules/resource_human/presentation/content/content_resource_human.dart';
import 'package:appweb/app/modules/resource_human/presentation/pages/resource_human_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResourceHumanModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const ResourceHumanPage(),
      children: [
        ChildRoute('/content/',
            child: (_, args) => const ContentResourceHuman()),
        ModuleRoute('/content/lineBusiness/',
            module: LinebusinessRegisterModule()),
        ModuleRoute('/content/collaborator/', module: CollaboratorModule()),
        ModuleRoute('/content/collaborator/register/',
            module: CollaboratorRegisterModule()),
      ],
    ),
  ];
}
