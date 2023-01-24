import 'package:appweb/app/modules/drawer/data/datasource/drawer_datasource.dart';
import 'package:appweb/app/modules/drawer/data/repository/drawer_repository_impl.dart';
import 'package:appweb/app/modules/drawer/domain/usecase/drawer_cashier_is_open.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class DrawerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<DrawerDataSource>(
          (i) => DrawerDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => DrawerRepositoryImpl(datasource: i.get<DrawerDataSource>()),
        ),
        Bind.factory(
          (i) => DrawerCashierIsOpen(repository: i.get<DrawerRepositoryImpl>()),
        ),
        Bind.singleton((i) => DrawerBloc(
              drawerCashierIsOpen: i.get<DrawerCashierIsOpen>(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [];
}
