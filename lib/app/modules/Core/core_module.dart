import 'package:appweb/app/modules/Core/data/datasource/cet_cnpj_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_cep_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_cities_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_salesman_datasource.dart';
import 'package:appweb/app/modules/Core/data/datasource/get_states_datasource.dart';
import 'package:appweb/app/modules/Core/data/repository/get_cep_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_cities_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_cnpj_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_salesman_repository_impl.dart';
import 'package:appweb/app/modules/Core/data/repository/get_states_repository_impl.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cep.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_citys.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cnpj.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_salesmans.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          (i) => GetSalesmanDataSourceImpl(),
          export: true,
        ),
        Bind.factory(
          (i) => GetSalesmanRepositoryImpl(
            datasource: i.get<GetSalesmanDataSourceImpl>(),
          ),
          export: true,
        ),
        Bind.factory(
          (i) => GetSalesmans(
            repository: i.get<GetSalesmanRepositoryImpl>(),
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
