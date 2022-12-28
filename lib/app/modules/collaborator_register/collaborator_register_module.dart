import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cep.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_citys.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cnpj.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_states.dart';
import 'package:appweb/app/modules/collaborator_register/data/datasource/collaborator_register_datasource.dart';
import 'package:appweb/app/modules/collaborator_register/data/repository/collaborator_register_repository_impl.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_register_get.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_register_get_list.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_register_post.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/pages/collaborator_register.dart';
import 'package:appweb/app/modules/line_business_register/data/datasource/remote/ownapi/linebusiness_register_datasource.dart';
import 'package:appweb/app/modules/line_business_register/data/repository/linebusiness_repository_impl.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_getlist.dart';
import 'package:appweb/app/modules/line_business_register/linebusiness_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class CollaboratorRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        LinebusinessRegisterModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<CollaboratorRegisterDatasource>(
          (i) => CollaboratorRegisterDatasourceImpl(),
        ),
        Bind.factory(
          (i) => CollaboratorRegisterRepositoryImpl(
              datasource: i.get<CollaboratorRegisterDatasource>()),
        ),
        Bind.factory(
          (i) => CollaboratorRegisterGetlist(
              repository: i.get<CollaboratorRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CollaboratorRegisterGet(
              repository: i.get<CollaboratorRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CollaboratorRegisterPost(
              repository: i.get<CollaboratorRegisterRepositoryImpl>()),
        ),
        Bind.factory<LinebusinessRegisterDataSource>(
          (i) => LinebusinessRegisterDataSourceImpl(),
        ),
        Bind.factory(
          (i) => LinebusinessRegisterRepositoryImpl(
              datasource: i.get<LinebusinessRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => LinebusinessRegisterGetlist(
              repository: i.get<LinebusinessRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => CollaboratorRegisterBloc(
              getlist: i.get<CollaboratorRegisterGetlist>(),
              getCep: i.get<GetCep>(),
              getCity: i.get<GetCities>(),
              getCnpj: i.get<GetCnpj>(),
              getStates: i.get<GetStates>(),
              getCollaborator: i.get<CollaboratorRegisterGet>(),
              postCollaborator: i.get<CollaboratorRegisterPost>(),
              getLinebusines: i.get<LinebusinessRegisterGetlist>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ContentCollaboratorRegister()),
  ];
}
