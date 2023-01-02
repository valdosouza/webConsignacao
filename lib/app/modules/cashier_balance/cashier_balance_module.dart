import 'package:appweb/app/modules/cashier_balance/data/datasource/cashier_balance_datasource.dart';
import 'package:appweb/app/modules/cashier_balance/data/repository/cashier_balance_repository_impl.dart';
import 'package:appweb/app/modules/cashier_balance/domain/usecase/cashier_balance_getlist.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_bloc.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/pages/cashier_balance_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierBalanceModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CashierBalanceDataSource>(
          (i) => CashierBalanceDataSourceImpl(),
        ),
        Bind.factory(
          (i) => CashierBalanceRepositoryImpl(datasource: i.get<CashierBalanceDataSource>()),
        ),
        Bind.factory(
          (i) => Getlist(repository: i.get<CashierBalanceRepositoryImpl>()),
        ),
        Bind.singleton((i) => CashierBalanceBloc(
              getlist: i.get<Getlist>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const CashierBalancePage()
    ),
  ];
}
