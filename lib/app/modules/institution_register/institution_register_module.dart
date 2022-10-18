import 'package:appweb/app/modules/institution_register/data/datasource/institution_register_datasource.dart';
import 'package:appweb/app/modules/institution_register/data/repository/institution_repository_impl.dart';
import 'package:appweb/app/modules/institution_register/domain/usecases/institution_get_usecase.dart';
import 'package:appweb/app/modules/institution_register/domain/usecases/institution_put_usecase.dart';
import 'package:appweb/app/modules/institution_register/domain/usecases/institution_register_usecase.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:appweb/app/modules/institution_register/presentation/pages/institution_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class InstitutionRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<InstitutionRegisterDatasource>(
          (i) => InstitutionRegisterDatasourceImpl(),
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
            )),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const InstitutionRegister()),
  ];
}
