import 'package:appweb/app/modules/Core/data/datasource/get_cnpj_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_cep_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_cities_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_region_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_sales_route_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_salesman_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_states_datasource.dart';
import 'package:appweb/app/modules/Core/data/repository/get_cep_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_cities_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_cnpj_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_region_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_sales_route_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_salesman_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_states_repository_impl.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cep.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_citys.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cnpj.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_region.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_sales_route.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_salesman.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        //GETCEP
        Bind.factory<GetCepDatasource>(
          (i) => GetCepDatasourceImpl(),
          export: true,
        ),
        Bind.factory(
          (i) => GetCepRepositoryImpl(
            datasource: i.get<GetCepDatasourceImpl>(),
          ),
          export: true,
        ),
        Bind.factory(
          (i) => GetCep(
            repository: i.get<GetCepRepositoryImpl>(),
          ),
          export: true,
        ),
        //GetCNPJ
        Bind.factory<GetCnpjDatasource>(
          (i) => GetCnpjDatasourceImpl(),
          export: true,
        ),
        Bind.factory(
          (i) => GetCnpjRepositoryImpl(
            datasource: i.get<GetCnpjDatasourceImpl>(),
          ),
          export: true,
        ),
        Bind.factory(
          (i) => GetCnpj(
            repository: i.get<GetCnpjRepositoryImpl>(),
          ),
          export: true,
        ),
        //GetState
        Bind.factory<GetStatesDatasource>(
          (i) => GetStatesDatasourceImpl(),
          export: true,
        ),
        Bind.factory(
          (i) => GetStatesRepositoryImpl(
            datasource: i.get<GetStatesDatasourceImpl>(),
          ),
          export: true,
        ),
        Bind.factory(
          (i) => GetStates(
            repository: i.get<GetStatesRepositoryImpl>(),
          ),
          export: true,
        ),
        //get Cities
        Bind.factory<GetCitiesDatasource>(
          (i) => GetCitiesDatasourceImpl(),
          export: true,
        ),
        Bind.factory(
          (i) => GetCitiesRepositoryImpl(
            datasource: i.get<GetCitiesDatasourceImpl>(),
          ),
          export: true,
        ),
        Bind.factory(
          (i) => GetCities(
            repository: i.get<GetCitiesRepositoryImpl>(),
          ),
          export: true,
        ),
        //Get vendedor
        Bind.factory<GetSalesmanDatasource>(
          (i) => GetSalesmanDataSourceImpl(httpClient: http.Client()),
          export: true,
        ),
        Bind.factory(
          (i) => GetSalesmanRepositoryImpl(
            datasource: i.get<GetSalesmanDataSourceImpl>(),
          ),
          export: true,
        ),
        Bind.factory(
          (i) => GetSalesman(
            repository: i.get<GetSalesmanRepositoryImpl>(),
          ),
          export: true,
        ),
        //Get Sales Route
        Bind.factory<GetSalesRouteDatasource>(
          (i) => GetSalesRouteDataSourceImpl(httpClient: http.Client()),
          export: true,
        ),
        Bind.factory(
          (i) => GetSalesRouteRepositoryImpl(
            datasource: i.get<GetSalesRouteDataSourceImpl>(),
          ),
          export: true,
        ),
        Bind.factory(
          (i) => GetSalesRoute(
            repository: i.get<GetSalesRouteRepositoryImpl>(),
          ),
          export: true,
        ),
        //Get REgion
        Bind.factory<GetRegionDatasource>(
          (i) => GetRegionDataSourceImpl(httpClient: http.Client()),
          export: true,
        ),
        Bind.factory(
          (i) => GetRegionRepositoryImpl(
            datasource: i.get<GetRegionDataSourceImpl>(),
          ),
          export: true,
        ),
        Bind.factory(
          (i) => GetRegion(
            repository: i.get<GetRegionRepositoryImpl>(),
          ),
          export: true,
        ),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => Container(),
    ),
  ];
}
