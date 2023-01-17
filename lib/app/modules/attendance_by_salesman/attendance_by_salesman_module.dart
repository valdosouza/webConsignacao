import 'package:appweb/app/modules/attendance_by_salesman/data/repository/customer_repository_impl.dart';
import 'package:appweb/app/modules/attendance_by_salesman/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/attendance_by_salesman/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/bloc/attendance_by_salesman_bloc.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/page/attendance_salesman_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class AttendanceBySalesmanModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CustomerDataSource>(
          (i) => CustomerDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) =>
              CustomerRepositoryImpl(datasource: i.get<CustomerDataSource>()),
        ),
        Bind.factory(
          (i) => CustomerGetlist(repository: i.get<CustomerRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => AttendanceBySalesmanBloc(
              getlistCustomer: i.get<CustomerGetlist>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile/',
      child: (_, args) => const AttendanceSalesmanPage(),
      children: [
        ChildRoute('/customer_list_by_salesman/',
            child: (_, args) => const AttendanceSalesmanPage()),
      ],
    ),
  ];
}
