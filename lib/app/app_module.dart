import 'package:appweb/app/core/shared/page_404.dart';
import 'package:appweb/app/modules/admin/admin_module.dart';
import 'package:appweb/app/modules/attendance_by_route/attendance_by_route_module.dart';
import 'package:appweb/app/modules/attendance_by_salesman/attendance_by_salesman_module.dart';
import 'package:appweb/app/modules/auth/auth_module.dart';
import 'package:appweb/app/modules/cashier/cashier_module.dart';
import 'package:appweb/app/modules/cashier_balance/cashier_balance_module.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/customer/customer_module.dart';
import 'package:appweb/app/modules/customer_register/customer_register_module.dart';
import 'package:appweb/app/modules/drawer/drawer_module.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_bloc.dart';
import 'package:appweb/app/modules/financial/financial_module.dart';
import 'package:appweb/app/modules/home/home_module.dart';
import 'package:appweb/app/modules/order_attendence_register/order_attendance_register_module.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';
import 'package:appweb/app/modules/order_production/order_production_module.dart';
import 'package:appweb/app/modules/product/product_module.dart';
import 'package:appweb/app/modules/resource_human/resource_human_module.dart';
import 'package:appweb/app/modules/splash/splash_module.dart';
import 'package:appweb/app/modules/stock/stock_module.dart';
import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';
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
        ModuleRoute('/stockbalance', module: StockBalanceModule()),
        ModuleRoute('/admin', module: AdminModule()),
        ModuleRoute('/product', module: ProductModule()),
        ModuleRoute('/customer', module: CustomerModule()),
        ModuleRoute('/customerregister', module: CustomerRegisterModule()),
        ModuleRoute('/financial', module: FinancialModule()),
        ModuleRoute('/resourcehuman', module: ResourceHumanModule()),
        ModuleRoute('/attendancesalesroute', module: AttendanceByRouteModule()),
        ModuleRoute('/attendancesalesman',
            module: AttendanceBySalesmanModule()),
        ModuleRoute('/orderproduction', module: OrderProductionModule()),
        ModuleRoute('/cashier', module: CashierModule()),
        ModuleRoute('/cashierbalance', module: CashierBalanceModule()),
        ModuleRoute('/cashierstatement', module: CashierStatementModule()),
        ModuleRoute('/attendance', module: OrderAttendanceRegisterModule()),
        ModuleRoute('/consignment', module: OrderConsignmentRegisterModule()),
        WildcardRoute(child: (_, __) => const Page404()),
      ];
}
