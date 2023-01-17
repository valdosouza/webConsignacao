import 'package:appweb/app/modules/order_attendence_register/data/datasource/order_attendance_datasource.dart';
import 'package:appweb/app/modules/order_attendence_register/data/repository/order_attendance_repository.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usecase/order_attendance_post.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_bloc.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/page/order_attendance_register_page.dart';
import 'package:appweb/app/modules/price_list_register/data/datasource/price_list_register_datasource.dart';
import 'package:appweb/app/modules/price_list_register/data/repository/price_list_register_repository_impl.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_get_list.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class OrderAttendanceRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<PriceListRegisterDataSource>(
          (i) => PriceListRegisterDataSourceImpl(),
        ),
        Bind.factory(
          (i) => PriceListRegisterRepositoryImpl(
              datasource: i.get<PriceListRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => PriceListRegisterGetlist(
              repository: i.get<PriceListRegisterRepositoryImpl>()),
        ),
        Bind.factory<OrderAttendanceDatasource>(
            (i) => OrderAttendanceDatasourceImpl()),
        Bind.factory((i) => OrderAttendanceRepositoryImpl(
            orderAttendanceDatasource: i.get<OrderAttendanceDatasourceImpl>())),
        Bind.factory((i) => OrderAttendancePost(
            repository: i.get<OrderAttendanceRepositoryImpl>())),
        BlocBind.singleton((i) => OrderAttendanceRegisterBloc(
              getPriceList: i.get<PriceListRegisterGetlist>(),
              postOrderAttendance: i.get<OrderAttendancePost>(),
            ))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => OrderAttendanceRegisterPage(model: args.data)),
      ];
}
