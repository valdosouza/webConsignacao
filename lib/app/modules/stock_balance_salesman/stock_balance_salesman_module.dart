import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/stock_balance_salesman/data/datasource/stock_balance_salesman_datasource.dart';
import 'package:appweb/app/modules/stock_balance_salesman/data/repository/stock_balance_salesman_repository_impl.dart';
import 'package:appweb/app/modules/stock_balance_salesman/domain/repository/stock_balance_salesman_respository.dart';
import 'package:appweb/app/modules/stock_balance_salesman/domain/usecase/stock_balance_salesman_getlist.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/bloc/stock_balance_salesman_bloc.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/pages/stock_balance_salesman_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceSalesmanModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => StockBalanceSalesmanDataSourceImpl(),
        ),
        Bind.factory(
          (i) => StockBalanceSalesmanRepositoryImpl(
              datasource: i.get<StockBalanceSalesmanDataSource>()),
        ),
        Bind.factory(
          (i) => StockBalanceSalesmanGetlist(
              repository: i.get<StockBalanceSalesmanRepository>()),
        ),
        Bind.singleton((i) => StockBalanceSalesmanBloc(
            getlist: i.get<StockBalanceSalesmanGetlist>())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const StockBalanceSalesmanPage(),
    ),
  ];
}
