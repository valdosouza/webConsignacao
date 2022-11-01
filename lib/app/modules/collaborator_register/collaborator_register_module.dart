import 'package:appweb/app/modules/collaborator_register/data/datasource/collaborator_register_datasource.dart';
import 'package:appweb/app/modules/collaborator_register/data/repository/collaborator_repository_impl.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_cep_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_citys.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_cnpj_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_line_business.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_states.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_put_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_register_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/pages/collaborator_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class CollaboratorRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CollaboratorRegisterDatasource>(
          (i) => CollaboratorRegisterDatasourceImpl(),
        ),
        Bind.factory(
          (i) => CollaboratorRegisterRespositoryImpl(
              datasource: i.get<CollaboratorRegisterDatasource>()),
        ),
        Bind.factory(
          (i) => CollaboratorRegisterSave(
              repository: i.get<CollaboratorRegisterRespositoryImpl>()),
        ),
        Bind.factory(
          (i) => CollaboratorRegisterGet(
              repository: i.get<CollaboratorRegisterRespositoryImpl>()),
        ),
        Bind.factory(
          (i) => CollaboratorPut(
              repository: i.get<CollaboratorRegisterRespositoryImpl>()),
        ),
        Bind.factory(
          (i) => CollaboratorGetCep(
              repository: i.get<CollaboratorRegisterRespositoryImpl>()),
        ),
        Bind.factory(
          (i) => CollaboratorGetCnpj(
              repository: i.get<CollaboratorRegisterRespositoryImpl>()),
        ),
        Bind.factory(
          (i) => CollaboratorGetStates(
              repository: i.get<CollaboratorRegisterRespositoryImpl>()),
        ),
        Bind.factory(
          (i) => CollaboratorGetCity(
              repository: i.get<CollaboratorRegisterRespositoryImpl>()),
        ),
        Bind.factory(
          (i) => CollaboratorGetLineBusiness(
              repository: i.get<CollaboratorRegisterRespositoryImpl>()),
        ),
        BlocBind.singleton((i) => CollaboratorRegisterBloc(
              save: i.get<CollaboratorRegisterSave>(),
              get: i.get<CollaboratorRegisterGet>(),
              put: i.get<CollaboratorPut>(),
              cep: i.get<CollaboratorGetCep>(),
              cnpj: i.get<CollaboratorGetCnpj>(),
              getStates: i.get<CollaboratorGetStates>(),
              getCity: i.get<CollaboratorGetCity>(),
              getLineBusiness: i.get<CollaboratorGetLineBusiness>()
            )),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CollaboratorRegister(collaborator: args.data,)),
  ];
}
