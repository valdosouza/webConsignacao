import 'package:appweb/app/modules/admin/presentation/content/content_admin.dart';
import 'package:appweb/app/modules/admin/presentation/pages/admin_page.dart';
import 'package:appweb/app/modules/collaborator_register/collaborator_register_module.dart';
import 'package:appweb/app/modules/institution_register/institution_register_module.dart';
import 'package:appweb/app/modules/user_register/user_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const AdminPage(),
      children: [
        ChildRoute('/content/', child: (_, args) => const ContentAdmin()),
        ModuleRoute('/content/institution/',
            module: CollaboratorRegisterModule()),
        ModuleRoute('/content/user/', module: UserRegisterModule()),
      ],
    ),
  ];
}
