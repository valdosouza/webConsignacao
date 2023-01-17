import 'package:appweb/app/modules/sales_route_register/data/datasource/sales_route_register_datasource.dart';
import 'package:appweb/app/modules/sales_route_register/data/repository/sales_route_register_repository_impl.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecase/sales_route_register_delete.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecase/sales_route_register_get_list.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecase/sales_route_register_post.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecase/sales_route_register_put.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_route_register_bloc.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/page/sales_route_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class SalesRouteRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<SalesRouteRegisterDataSource>(
          (i) => SalesRouteRegisterDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => SalesRouteRegisterRepositoryImpl(
              datasource: i.get<SalesRouteRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => SalesRouteRegisterGetlist(
              repository: i.get<SalesRouteRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => SalesRouteRegisterPost(
              repository: i.get<SalesRouteRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => SalesRouteRegisterPut(
              repository: i.get<SalesRouteRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => SalesRouteRegisterDelete(
              repository: i.get<SalesRouteRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => SalesRouteRegisterBloc(
              getlist: i.get<SalesRouteRegisterGetlist>(),
              post: i.get<SalesRouteRegisterPost>(),
              put: i.get<SalesRouteRegisterPut>(),
              delete: i.get<SalesRouteRegisterDelete>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SalesRouteRegister()),
  ];
}
