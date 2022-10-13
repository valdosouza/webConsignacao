import 'package:appweb/app/modules/admin/presentation/content/content_admin.dart';
import 'package:appweb/app/modules/admin/presentation/pages/admin_page.dart';
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
      ],
    ),
  ];
}
