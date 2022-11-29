import 'package:appweb/app/core/shared/page_404.dart';
import 'package:appweb/app/modules/admin/admin_module.dart';
import 'package:appweb/app/modules/attendance_sales_route/attendance_sales_route_module.dart';
import 'package:appweb/app/modules/attendance_salesman/attendance_salesman_module.dart';
import 'package:appweb/app/modules/auth/auth_module.dart';
import 'package:appweb/app/modules/cashier/cashier_module.dart';
import 'package:appweb/app/modules/customer/customer_module.dart';
import 'package:appweb/app/modules/drawer/drawer_module.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_bloc.dart';
import 'package:appweb/app/modules/financial/financial_module.dart';
import 'package:appweb/app/modules/home/home_module.dart';
import 'package:appweb/app/modules/product/product_module.dart';
import 'package:appweb/app/modules/resource_human/resource_human_module.dart';
import 'package:appweb/app/modules/splash/splash_module.dart';
import 'package:appweb/app/modules/stock/stock_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        AsyncBind((i) => SharedPreferences.getInstance()),
        Bind.singleton((i) => DrawerBloc()),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/drawer', module: DrawerModule()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/stock', module: StockModule()),
        ModuleRoute('/admin', module: AdminModule()),
        ModuleRoute('/product', module: ProductModule()),
        ModuleRoute('/customer', module: CustomerModule()),
        ModuleRoute('/financial', module: FinancialModule()),
        ModuleRoute('/resourcehuman', module: ResourceHumanModule()),
        ModuleRoute('/customer', module: CustomerModule()),
        ModuleRoute('/attendancesalesroute',
            module: AttendanceSalesRouteModule()),
        ModuleRoute('/attendancesalesman', module: AttendanceSalesmanModule()),
        ModuleRoute('/cashier', module: CashierModule()),
        WildcardRoute(child: (_, __) => const Page404()),
      ];
}
