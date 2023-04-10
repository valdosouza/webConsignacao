import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/page/page.dart';
import 'package:appweb/app/modules/stock/presentation/page/stock_page_desktop.dart';
import 'package:appweb/app/modules/stock/presentation/page/stock_page_mobile.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/stock_balance_salesman_page.dart';
import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/desktop/',
      child: (_, args) => const StockPageDesktop(),
      children: [
        ModuleRoute('/', module: StockBalanceModule()),
        ModuleRoute(
          '/stockadjustement/',
          module: OrderStockAdjustmentRegisterModule(),
        ),
        ModuleRoute(
          '/stocktransfer/',
          module: OrderStockTransferRegisterModule(),
        ),
        ModuleRoute(
          '/stockbalance/',
          module: StockBalanceModule(),
        ),
      ],
    ),
    ChildRoute(
      '/mobile/',
      child: (_, args) => const StockPageMobile(),
    ),
    ChildRoute(
      '/mobile/reload/',
      child: (_, args) => const Page(),
      children: [
        ModuleRoute(
          '/stocktransfer/',
          module: OrderStockTransferRegisterModule(),
        ),
      ],
    ),
    ChildRoute(
      '/mobile/balance/',
      child: (_, args) => const StockBalanceSalesmanPage(),
      children: [
        ModuleRoute(
          '/',
          module: StockBalanceModule(),
        ),
      ],
    ),
  ];
}
