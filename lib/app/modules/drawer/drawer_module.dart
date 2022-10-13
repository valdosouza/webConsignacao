import 'package:appweb/app/modules/admin/presentation/pages/admin_page.dart';
import 'package:appweb/app/modules/auth/presentation/pages/auth_page.dart';
import 'package:appweb/app/modules/drawer/presentation/cubit/drawer_cubit.dart';
import 'package:appweb/app/modules/home/presentation/pages/home_page.dart';
import 'package:appweb/app/modules/product/presentation/pages/product_page.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => DrawerCubit(),
        ),
      ];
  @override
  List<ModularRoute> get routes => [
        //ChildRoute('/', child: (context, args) => const DrawerPage()),
        ChildRoute('/auth/', child: (_, args) => AuthPage()),
        ChildRoute('/home/', child: (_, args) => const HomePage()),
        ChildRoute('/admin/', child: (_, args) => const AdminPage()),
        ChildRoute('/product/', child: (_, args) => const ProductPage()),
        ChildRoute('/stock/', child: (_, args) => const StockPage()),
      ];
}
