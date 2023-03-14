import 'package:appweb/app/core/shared/page_404.dart';
import 'package:appweb/app/modules/auth/auth_module.dart';
import 'package:appweb/app/modules/drawer/data/datasource/drawer_datasource.dart';
import 'package:appweb/app/modules/drawer/data/repository/drawer_repository_impl.dart';
import 'package:appweb/app/modules/drawer/domain/usecase/drawer_cashier_is_open.dart';
import 'package:appweb/app/modules/drawer/drawer_module.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_bloc.dart';
import 'package:appweb/app/modules/home/home_module.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/splash/splash_module.dart';
import 'package:appweb/app/modules/stock/stock_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        AsyncBind((i) => SharedPreferences.getInstance()),
        Bind.factory<DrawerDataSource>(
          (i) => DrawerDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => DrawerRepositoryImpl(datasource: i.get<DrawerDataSource>()),
        ),
        Bind.factory(
          (i) => DrawerCashierIsOpen(repository: i.get<DrawerRepositoryImpl>()),
        ),
        Bind.singleton((i) => DrawerBloc(
              drawerCashierIsOpen: i.get<DrawerCashierIsOpen>(),
            )),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/drawer', module: DrawerModule()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/stock', module: StockModule()),
        ModuleRoute('/orderstockadjustment',
            module: OrderStockAdjustmentRegisterModule()),
        ModuleRoute('/orderstocktransfer',
            module: OrderStockTransferRegisterModule()),
        WildcardRoute(child: (_, __) => const Page404()),
      ];
}
