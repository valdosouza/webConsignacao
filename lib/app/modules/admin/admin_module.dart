import 'package:appweb/app/modules/admin/presentation/page/admin_page.dart';
import 'package:appweb/app/modules/institution_register/institution_register_module.dart';
import 'package:appweb/app/modules/region_register/region_register_module.dart';
import 'package:appweb/app/modules/sales_route_register/sales_route_register_module.dart';
import 'package:appweb/app/modules/user_register/user_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/content/',
      child: (_, args) => const AdminPage(),
      children: [
        ModuleRoute('/institution/', module: InstitutionRegisterModule()),
        ModuleRoute('/user/', module: UserRegisterModule()),
        ModuleRoute('/salesroute/', module: SalesRouteRegisterModule()),
        ModuleRoute('/region/', module: RegionRegisterModule()),
      ],
    ),
  ];
}
