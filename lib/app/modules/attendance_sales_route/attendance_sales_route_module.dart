import 'package:appweb/app/modules/attendance_sales_route/presentation/content/content_attendance_sales_route.dart';
import 'package:appweb/app/modules/attendance_sales_route/presentation/pages/attendance_sales_route_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceSalesRouteModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile/',
      child: (_, args) => const AttendanceSalesRoutePage(),
      children: [
        ChildRoute('/customer_list_by_route/',
            child: (_, args) => const ContentAttendanceSalesRoute()),
      ],
    ),
  ];
}
