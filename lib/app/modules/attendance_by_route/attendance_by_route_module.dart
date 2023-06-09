import 'package:appweb/app/modules/attendance_by_route/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/attendance_by_route/data/datasource/sales_route_datasource.dart';
import 'package:appweb/app/modules/attendance_by_route/data/repository/customer_repository_impl.dart';
import 'package:appweb/app/modules/attendance_by_route/data/repository/sales_route_repository_impl.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_sequence.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_set_turn_back.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/sales_route_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/page/attendance_sales_route_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class AttendanceByRouteModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<SalesRouteDataSource>(
          (i) => SalesRouteDataSourceImpl(httpClient: http.Client()),
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
          (i) => CustomerDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) =>
              CustomerRepositoryImpl(datasource: i.get<CustomerDataSource>()),
        ),
        Bind.factory(
          (i) => CustomerGetlist(repository: i.get<CustomerRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CustomerSequence(repository: i.get<CustomerRepositoryImpl>()),
        ),
        Bind.factory(
          (i) =>
              CustomerSetTurnBack(repository: i.get<CustomerRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => AttendanceByRouteBloc(
              getlistSalesRoute: i.get<SalesRouteGetlist>(),
              getlistCustomer: i.get<CustomerGetlist>(),
              sequence: i.get<CustomerSequence>(),
              customerSetTurnBack: i.get<CustomerSetTurnBack>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile/',
      child: (_, args) => AttendanceSalesRoutePage(
        tbSalesRouteId: args.data[0],
        nameSalesRoute: args.data[1],
        tbRegionId: args.data[2],
        nameRegion: args.data[3],
      ),
      children: [
        ChildRoute(
          '/customer_list_by_route/',
          child: (_, args) => AttendanceSalesRoutePage(
            tbSalesRouteId: args.data[0],
            nameSalesRoute: args.data[1],
            tbRegionId: args.data[2],
            nameRegion: args.data[3],
          ),
        ),
      ],
    ),
  ];
}
