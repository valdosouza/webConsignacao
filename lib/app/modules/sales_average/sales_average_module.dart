import 'package:appweb/app/modules/sales_average/data/datasource/datasource.dart';
import 'package:appweb/app/modules/sales_average/data/repository/repository_impl.dart';
import 'package:appweb/app/modules/sales_average/domain/usecase/get_region.dart';
import 'package:appweb/app/modules/sales_average/domain/usecase/get_sales_average.dart';
import 'package:appweb/app/modules/sales_average/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/sales_average/presentation/page/desktop/sales_average_page_desktop.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class SalesAverageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<DataSource>(
          (i) => DataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory<RepositoryImpl>(
          (i) => RepositoryImpl(datasource: i.get<DataSourceImpl>()),
        ),
        Bind.factory<GetRegion>(
            (i) => GetRegion(repository: i.get<RepositoryImpl>())),
        Bind.factory<GetSalesAverage>(
            (i) => GetSalesAverage(repository: i.get<RepositoryImpl>())),
        Bind.singleton<SalesAverageBloc>(
          (i) => SalesAverageBloc(
            getRegion: i.get<GetRegion>(),
            getSalesAverage: i.get<GetSalesAverage>(),
          ),
        )
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/desktop/salesaverage/region/',
      child: (_, args) => const SalesAveragePageDesktop(),
    ),
  ];
}
