import 'package:appweb/app/modules/attendance_salesman/presentation/content/content_attendance_salesman.dart';
import 'package:appweb/app/modules/attendance_salesman/presentation/pages/attendance_salesman_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceSalesmanModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile/',
      child: (_, args) => const AttendanceSalesmanPage(),
      children: [
        ChildRoute('/customer_list_by_salesman/',
            child: (_, args) => const ContentAttendanceSalesman()),
      ],
    ),
  ];
}
