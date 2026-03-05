import 'package:appweb/app/app_module.dart';
import 'package:appweb/app/core/shared/page_404.dart';
import 'package:appweb/app/modules/admin/admin_module.dart';
import 'package:appweb/app/modules/attendance_by_route/attendance_by_route_module.dart';
import 'package:appweb/app/modules/attendance_by_customer/attendance_by_customer_module.dart';
import 'package:appweb/app/modules/cashier/cashier_module.dart';
import 'package:appweb/app/modules/cashier_balance/cashier_balance_module.dart';
import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement_summary/cashier_statement_summary_module.dart';
import 'package:appweb/app/modules/customer/customer_module.dart';
import 'package:appweb/app/modules/customer_register/customer_register_module.dart';
import 'package:appweb/app/modules/drawer/drawer_module.dart';
import 'package:appweb/app/modules/financial/financial_module.dart';
import 'package:appweb/app/modules/home/home_module.dart';
import 'package:appweb/app/modules/order_attendence_register/order_attendance_register_module.dart';
import 'package:appweb/app/modules/order_bonus_register/order_bonus_register_module.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_production/order_production_module.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/product/product_module.dart';
import 'package:appweb/app/modules/region_register/region_register_module.dart';
import 'package:appweb/app/modules/resource_human/resource_human_module.dart';
import 'package:appweb/app/modules/splash/splash_module.dart';
import 'package:appweb/app/modules/stock/stock_module.dart';
import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_module_test.dart';

/// App module for integration tests: same as [AppModule] but uses [AuthModuleTest]
/// so login does not hit the real API.
class TestAppModule extends Module {
  @override
  List<Bind> get binds => AppModule().binds;

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/drawer', module: DrawerModule()),
        ModuleRoute('/auth', module: AuthModuleTest()),
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
        ModuleRoute('/attendancecustomer',
            module: AttendanceByCustomerModule()),
        ModuleRoute('/orderproduction', module: OrderProductionModule()),
        ModuleRoute('/orderstockadjustment',
            module: OrderStockAdjustmentRegisterModule()),
        ModuleRoute('/orderstocktransfer',
            module: OrderStockTransferRegisterModule()),
        ModuleRoute('/orderbonus', module: OrderBonusRegisterModule()),
        ModuleRoute('/cashier', module: CashierModule()),
        ModuleRoute('/cashierbalance', module: CashierBalanceModule()),
        ModuleRoute('/cashierstatement', module: CashierStatementModule()),
        ModuleRoute('/cashierstatementsummary',
            module: CashierStatementSummaryModule()),
        ModuleRoute('/cashierclosure', module: CashierClosureModule()),
        ModuleRoute('/attendance', module: OrderAttendanceRegisterModule()),
        ModuleRoute('/consignment', module: OrderConsignmentRegisterModule()),
        ModuleRoute('/ordersale', module: OrderSaleRegisterModule()),
        ModuleRoute('/orderloadCard', module: OrderLoadCardRegisterModule()),
        ModuleRoute('/region', module: RegionRegisterModule()),
        WildcardRoute(child: (_, __) => const Page404()),
      ];
}
