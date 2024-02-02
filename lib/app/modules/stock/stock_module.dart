import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/stock/data/datasource/datasource.dart';
import 'package:appweb/app/modules/stock/data/repository/repository_impl.dart';
import 'package:appweb/app/modules/stock/domain/usecase/cashier_is_open.dart';
import 'package:appweb/app/modules/stock/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/stock/presentation/page/stock_page_desktop.dart';
import 'package:appweb/app/modules/stock/presentation/page/stock_page_mobile.dart';
import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';
import 'package:appweb/app/modules/stock_list_register/stock_list_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class StockModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<DataSource>(
          (i) => DataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => RepositoryImpl(datasource: i.get<DataSource>()),
        ),
        Bind.factory(
          (i) => CashierIsOpen(repository: i.get<RepositoryImpl>()),
        ),
        Bind.singleton((i) => StockBloc(cashierIsOpen: i.get<CashierIsOpen>())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/desktop/',
      child: (_, args) => const StocPageDesktop(),
      children: [
        ModuleRoute('/', module: StockBalanceModule()),
        ModuleRoute(
          '/stocklist/',
          module: StockListRegisterModule(),
        ),
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
        ModuleRoute(
          '/orderloadCard/',
          module: OrderLoadCardRegisterModule(),
        ),
      ],
    ),
    ChildRoute(
      '/mobile/',
      child: (_, args) => const StocPageMobile(),
    ),
  ];
}
