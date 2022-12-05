import 'package:appweb/app/modules/line_business_register/data/datasource/remote/ownapi/linebusiness_register_datasource.dart';
import 'package:appweb/app/modules/line_business_register/data/repository/linebusiness_repository_impl.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_delete.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_getlist.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_post.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_put.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_bloc.dart';
import 'package:appweb/app/modules/line_business_register/presentation/pages/linebusiness_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class LinebusinessRegisterModule extends Module {
  @override
  List<Bind> get binds => [
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
        Bind.factory(
          (i) => LinebusinessRegisterPost(
              repository: i.get<LinebusinessRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => LinebusinessRegisterPut(
              repository: i.get<LinebusinessRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => LinebusinessRegisterDelete(
              repository: i.get<LinebusinessRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton(
          (i) => LinebusinessRegisterBloc(
            getlist: i.get<LinebusinessRegisterGetlist>(),
            post: i.get<LinebusinessRegisterPost>(),
            put: i.get<LinebusinessRegisterPut>(),
            delete: i.get<LinebusinessRegisterDelete>(),
          ),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LinebusinessRegister()),
  ];
}
