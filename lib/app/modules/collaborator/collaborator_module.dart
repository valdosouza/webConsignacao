import 'package:appweb/app/modules/collaborator/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator/presentation/content/content_collaborator.dart';
import 'package:appweb/app/modules/collaborator_register/data/datasource/collaborator_register_datasource.dart';
import 'package:appweb/app/modules/collaborator_register/data/repository/collaborator_repository_impl.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_getlist_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<CollaboratorRegisterDatasource>(
      (i) => CollaboratorRegisterDatasourceImpl(),
    ),
    Bind.factory(
      (i) => CollaboratorRegisterRespositoryImpl(
          datasource: i.get<CollaboratorRegisterDatasourceImpl>()),
    ),
    Bind.factory((i) => CollaboratorGetlist(
        repository: i.get<CollaboratorRegisterRespositoryImpl>())),
    Bind.singleton(
        (i) => CollaboratorBloc(getlist: i.get<CollaboratorGetlist>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (context, args) => const ContentCollaboratorList())
  ];
}
