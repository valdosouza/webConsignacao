import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/stock_balance_general/data/datasource/stock_balance_general_datasource.dart';
import 'package:appweb/app/modules/stock_balance_general/data/repository/stock_balance_general_repository_impl.dart';
import 'package:appweb/app/modules/stock_balance_general/domain/repository/stock_balance_general_respository.dart';
import 'package:appweb/app/modules/stock_balance_general/domain/usecase/stock_balance_general_getlist.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/bloc/stock_balance_general_bloc.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/pages/order_production_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceGeneralModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => StockBalanceGeneralDataSourceImpl(),
        ),
        Bind.factory(
          (i) => StockBalanceGeneralRepositoryImpl(
              datasource: i.get<StockBalanceGeneralDataSource>()),
        ),
        Bind.factory(
          (i) => StockBalanceGeneralGetlist(
              repository: i.get<StockBalanceGeneralRepository>()),
        ),
        Bind.singleton((i) => StockBalanceGeneralBloc(
            getlist: i.get<StockBalanceGeneralGetlist>())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const StockBalanceGeneralPage(),
    ),
  ];
}
