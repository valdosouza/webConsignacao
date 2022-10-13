import 'package:appweb/app/modules/admin/presentation/content/content_admin.dart';
import 'package:appweb/app/modules/admin/presentation/pages/admin_page.dart';
import 'package:appweb/app/modules/institution_register/presentation/pages/institution_register.dart';
import 'package:appweb/app/modules/user_register/presentation/pages/user_register.dart';
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
        ChildRoute('/content/institution/',
            child: (_, args) => const InstitutionRegister()),
        ChildRoute('/content/user/', child: (_, args) => const UserRegister()),
      ],
    ),
  ];
}
