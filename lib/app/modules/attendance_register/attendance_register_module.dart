import 'package:appweb/app/modules/attendance_register/presentation/pages/attendance_register_page.dart';
import 'package:appweb/app/modules/attendance_salesman/presentation/content/content_attendance_salesman.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceRegisterModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile',
      child: (_, args) => const AttendanceRegisterPage(),
      children: [
        ChildRoute('/content/',
            child: (_, args) => const ContentAttendanceSalesman()),
      ],
    ),
  ];
}
