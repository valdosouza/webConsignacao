import 'package:appweb/app/modules/line_business_register/data/datasource/remote/ownapi/line_business_data_source.dart';
import 'package:appweb/app/modules/line_business_register/data/repository/line_business_repository_impl.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/line_business_delete.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/line_business_getlist.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/line_business_post.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/line_business_put.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_bloc.dart';
import 'package:appweb/app/modules/line_business_register/presentation/pages/line_business_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class LinebusinessRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<LineBusinessDatasource>(
          (i) => LineBusinessDatasourceImpl(),
        ),
        Bind.factory(
          (i) => LineBusinessRepositoryImpl(
              datasource: i.get<LineBusinessDatasourceImpl>()),
        ),
        Bind.factory(
          (i) => LineBusinessGetlist(
              repository: i.get<LineBusinessRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => LineBusinessDelete(
              repository: i.get<LineBusinessRepositoryImpl>()),
        ),
        Bind.factory(
          (i) =>
              LineBusinessPost(repository: i.get<LineBusinessRepositoryImpl>()),
        ),
        Bind.factory(
          (i) =>
              LineBusinessPut(repository: i.get<LineBusinessRepositoryImpl>()),
        ),
        BlocBind.factory(
          (i) => LineBusinessBloc(
            getlist: i.get<LineBusinessGetlist>(),
            delete: i.get<LineBusinessDelete>(),
            post: i.get<LineBusinessPost>(),
            put: i.get<LineBusinessPut>(),
          ),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LineBusinessRegister()),
  ];
}
