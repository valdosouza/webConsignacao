import 'package:appweb/app/modules/splash/data/datasource/splash_datasource.dart';
import 'package:appweb/app/modules/splash/data/repository/splash_repository_impl.dart';
import 'package:appweb/app/modules/splash/domain/usecase/get_authorization.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_bloc.dart';
import 'package:appweb/app/modules/splash/presentation/page/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<SplashDataSource>(
          (i) => SplashDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => SplashRepositoryImpl(datasource: i.get<SplashDataSource>()),
        ),
        Bind.factory(
          (i) => GetAuthorization(repository: i.get<SplashRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => SplashBloc(
              getAuthorization: i.get<GetAuthorization>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
