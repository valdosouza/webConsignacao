import 'package:appweb/app/modules/attendance_ordering/data/datasource/datasource.dart';
import 'package:appweb/app/modules/attendance_ordering/data/repository/repository_impl.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/apply_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_customer.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_region.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_route.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/set_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/page/page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class AttendanceOrderingModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<DataSource>(
          (i) => DataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory<RepositoryImpl>(
          (i) => RepositoryImpl(datasource: i.get<DataSourceImpl>()),
        ),
        Bind.factory<GetRegion>(
          (i) => GetRegion(repository: i.get<RepositoryImpl>()),
        ),
        Bind.factory<GetRoute>(
          (i) => GetRoute(repository: i.get<RepositoryImpl>()),
        ),
        Bind.factory<GetCustomer>(
          (i) => GetCustomer(repository: i.get<RepositoryImpl>()),
        ),
        Bind.factory<SetDefaultSequence>(
          (i) => SetDefaultSequence(repository: i.get<RepositoryImpl>()),
        ),
        Bind.factory<ApplytDefaultSequence>(
          (i) => ApplytDefaultSequence(repository: i.get<RepositoryImpl>()),
        ),
        Bind.singleton<AttendanceOrderingBloc>(
          (i) => AttendanceOrderingBloc(
            getRegion: i.get<GetRegion>(),
            getRoute: i.get<GetRoute>(),
            getCustomer: i.get<GetCustomer>(),
            setDefaultSequence: i.get<SetDefaultSequence>(),
            applytDefaultSequence: i.get<ApplytDefaultSequence>(),
          ),
        )
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const Page(),
    ),
  ];
}
