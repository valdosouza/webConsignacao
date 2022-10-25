import 'package:appweb/app/modules/home/data/remote/ownapi/home_datasource.dart';
import 'package:appweb/app/modules/home/data/repository/home_repository_impl.dart';
import 'package:appweb/app/modules/home/domain/usecase/get_financial_closed_usecase.dart';
import 'package:appweb/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:appweb/app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => HomeDatasourceImpl(),
        ),
        Bind.factory(
          (i) => HomeRepositoryImpl(datasource: i.get<HomeDatasourceImpl>()),
        ),
        Bind.factory(
          (i) => GetFinancialClosedUseCase(
              repository: i.get<HomeRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => HomeBloc(
            getFinancialClosedUseCase: i.get<GetFinancialClosedUseCase>()))
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
