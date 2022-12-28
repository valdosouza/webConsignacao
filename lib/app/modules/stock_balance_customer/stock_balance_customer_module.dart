import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/stock_balance_customer/data/datasource/stock_balance_customer_datasource.dart';
import 'package:appweb/app/modules/stock_balance_customer/data/repository/stock_balance_customer_repository_impl.dart';
import 'package:appweb/app/modules/stock_balance_customer/domain/repository/stock_balance_customer_respository.dart';
import 'package:appweb/app/modules/stock_balance_customer/domain/usecase/stock_balance_customer_getlist.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/bloc/stock_balance_customer_bloc.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/pages/stock_balance_customer_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceCustomerModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => StockBalanceCustomerDataSourceImpl(),
        ),
        Bind.factory(
          (i) => StockBalanceCustomerRepositoryImpl(
              datasource: i.get<StockBalanceCustomerDataSource>()),
        ),
        Bind.factory(
          (i) => StockBalanceCustomerGetlist(
              repository: i.get<StockBalanceCustomerRepository>()),
        ),
        Bind.singleton((i) => StockBalanceCustomerBloc(
            getlist: i.get<StockBalanceCustomerGetlist>())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const StockBalanceCustomerPage(),
    ),
  ];
}
