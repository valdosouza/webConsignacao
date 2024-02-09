import 'package:appweb/app/modules/cashier_statement_summary/data/datasource/datasource.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/repository/repository_impl.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/usecase/get.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/usecase/get_salesmans.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/page/desktop.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementSummaryModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<DataSource>(
          (i) => DataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory<RepositoryImpl>(
          (i) => RepositoryImpl(datasource: i.get<DataSourceImpl>()),
        ),
        Bind.factory<GetSalesmans>(
            (i) => GetSalesmans(repository: i.get<RepositoryImpl>())),
        Bind.factory<Get>((i) => Get(repository: i.get<RepositoryImpl>())),
        Bind.singleton<CashierStatementSummaryBloc>(
          (i) => CashierStatementSummaryBloc(
            get: i.get<Get>(),
            getSalesmans: i.get<GetSalesmans>(),
          ),
        )
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/desktop/cashierstatementsummary/monthly/',
      child: (_, args) => const Desktop(),
    ),
  ];
}
