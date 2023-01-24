import 'package:appweb/app/modules/attendance_by_customer/data/repository/customer_repository_impl.dart';
import 'package:appweb/app/modules/attendance_by_customer/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/attendance_by_customer/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_bloc.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/page/attendance_salesman_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class AttendanceByCustomerModule extends Module {
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
        BlocBind.singleton((i) => AttendanceByCustomerBloc(
              getlistCustomer: i.get<CustomerGetlist>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile/',
      child: (_, args) => const AttendanceCustomerPage(),
      children: [
        ChildRoute('/customer_list_by_customer/',
            child: (_, args) => const AttendanceCustomerPage()),
      ],
    ),
  ];
}
