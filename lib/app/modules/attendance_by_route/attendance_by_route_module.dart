import 'package:appweb/app/modules/attendance_by_route/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/attendance_by_route/data/datasource/sales_route_datasource.dart';
import 'package:appweb/app/modules/attendance_by_route/data/repository/customer_repository_impl.dart';
import 'package:appweb/app/modules/attendance_by_route/data/repository/sales_route_repository_impl.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/sales_route_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/pages/attendance_sales_route_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class AttendanceByRouteModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<SalesRouteDataSource>(
          (i) => SalesRouteDataSourceImpl(),
        ),
        Bind.factory(
          (i) => SalesRouteRepositoryImpl(
              datasource: i.get<SalesRouteDataSource>()),
        ),
        Bind.factory(
          (i) =>
              SalesRouteGetlist(repository: i.get<SalesRouteRepositoryImpl>()),
        ),
        Bind.factory<CustomerDataSource>(
          (i) => CustomerDataSourceImpl(),
        ),
        Bind.factory(
          (i) =>
              CustomerRepositoryImpl(datasource: i.get<CustomerDataSource>()),
        ),
        Bind.factory(
          (i) => CustomerGetlist(repository: i.get<CustomerRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => AttendanceByRouteBloc(
              getlistSalesRoute: i.get<SalesRouteGetlist>(),
              getlistCustomer: i.get<CustomerGetlist>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile/',
      child: (_, args) => const AttendanceSalesRoutePage(),
      children: [
        ChildRoute('/customer_list_by_route/',
            child: (_, args) => const AttendanceSalesRoutePage()),
      ],
    ),
  ];
}
