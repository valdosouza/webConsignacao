import 'package:appweb/app/modules/cashier_balance/data/datasource/cashier_balance_datasource.dart';
import 'package:appweb/app/modules/cashier_balance/data/repository/cashier_balance_repository_impl.dart';
import 'package:appweb/app/modules/cashier_balance/domain/usecase/cashier_balance_get.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_bloc.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/pages/cashier_balance_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class CashierBalanceModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CashierBalanceDataSource>(
          (i) => CashierBalanceDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => CashierBalanceRepositoryImpl(
              datasource: i.get<CashierBalanceDataSource>()),
        ),
        Bind.factory(
          (i) => CashierBalanceGet(
              repository: i.get<CashierBalanceRepositoryImpl>()),
        ),
        Bind.singleton((i) => CashierBalanceBloc(
              cashierbalance: i.get<CashierBalanceGet>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CashierBalancePage()),
  ];
}
