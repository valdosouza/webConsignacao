import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_salesman.dart';
import 'package:appweb/app/modules/region_register/data/datasource/region_register_datasource.dart';
import 'package:appweb/app/modules/region_register/data/repository/region_register_repository_impl.dart';
import 'package:appweb/app/modules/region_register/domain/usecase/region_register_delete.dart';
import 'package:appweb/app/modules/region_register/domain/usecase/region_register_get_list.dart';
import 'package:appweb/app/modules/region_register/domain/usecase/region_register_post.dart';
import 'package:appweb/app/modules/region_register/domain/usecase/region_register_put.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_bloc.dart';
import 'package:appweb/app/modules/region_register/presentation/page/region_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class RegionRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<RegionRegisterDataSource>(
          (i) => RegionRegisterDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => RegionRegisterRepositoryImpl(
              datasource: i.get<RegionRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => RegionRegisterGetlist(
              repository: i.get<RegionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => RegionRegisterPost(
              repository: i.get<RegionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => RegionRegisterPut(
              repository: i.get<RegionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => RegionRegisterDelete(
              repository: i.get<RegionRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => RegionRegisterBloc(
              getlist: i.get<RegionRegisterGetlist>(),
              post: i.get<RegionRegisterPost>(),
              put: i.get<RegionRegisterPut>(),
              delete: i.get<RegionRegisterDelete>(),
              getSalesmans: i.get<GetSalesman>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegionRegister()),
  ];
}
