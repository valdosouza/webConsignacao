import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cep.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_citys.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cnpj.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_states.dart';
import 'package:appweb/app/modules/institution_register/data/datasource/institution_register_datasource.dart';
import 'package:appweb/app/modules/institution_register/data/repository/institution_repository_impl.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_register_get.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_register_put.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_register_post.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:appweb/app/modules/institution_register/presentation/pages/institution_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class InstitutionRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<InstitutionRegisterDatasource>(
          (i) => InstitutionRegisterDatasourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => InstitutionRegisterRespositoryImpl(
              datasource: i.get<InstitutionRegisterDatasourceImpl>()),
        ),
        Bind.factory(
          (i) => InstitutionRegisterSave(
              repository: i.get<InstitutionRegisterRespositoryImpl>()),
        ),
        Bind.factory(
          (i) => InstitutionRegisterGet(
              repository: i.get<InstitutionRegisterRespositoryImpl>()),
        ),
        Bind.factory(
          (i) => InstitutionPut(
              repository: i.get<InstitutionRegisterRespositoryImpl>()),
        ),
        BlocBind.singleton((i) => InstitutionBloc(
              save: i.get<InstitutionRegisterSave>(),
              get: i.get<InstitutionRegisterGet>(),
              put: i.get<InstitutionPut>(),
              cep: i.get<GetCep>(),
              cnpj: i.get<GetCnpj>(),
              getStates: i.get<GetStates>(),
              getCity: i.get<GetCities>(),
            )),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const InstitutionRegister()),
  ];
}
