import 'package:appweb/app/modules/order_attendence_register/data/datasources/order_attendance_checkpoint.dart';
import 'package:appweb/app/modules/order_attendence_register/data/datasources/order_attendance_datasource.dart';
import 'package:appweb/app/modules/order_attendence_register/data/datasources/order_attendance_supplying_datasources.dart';
import 'package:appweb/app/modules/order_attendence_register/data/repository/order_attendance_checkpoint_repository.dart';
import 'package:appweb/app/modules/order_attendence_register/data/repository/order_attendance_repository.dart';
import 'package:appweb/app/modules/order_attendence_register/data/repository/order_attendance_supplying_repository.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_checkpoint_get_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_checkpoint_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_delete_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_get_all_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_get_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_post_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_put_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_supplying_get_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_supplying_getlast_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_supplying_post_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_bloc.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/pages/order_attendance_checkppoint_page.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/pages/order_attendance_register_page.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/pages/order_attendance_supplying_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class OrderAttendanceRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<OrderAttendanceDatasource>(
            (i) => OrderAttendanceDatasourceImpl()),
        Bind.factory((i) => OrderAttendanceRepositoryImpl(
            orderAttendanceDatasource: i.get<OrderAttendanceDatasourceImpl>())),
        Bind.factory((i) => OrderAttendanceGetUsescases(
            repository: i.get<OrderAttendanceRepositoryImpl>())),
        Bind.factory((i) => OrderAttendancePutUsescases(
            repository: i.get<OrderAttendanceRepositoryImpl>())),
        Bind.factory((i) => OrderAttendanceDeleteUsescases(
            repository: i.get<OrderAttendanceRepositoryImpl>())),
        Bind.factory((i) => OrderAttendancePostUsescases(
            repository: i.get<OrderAttendanceRepositoryImpl>())),
        Bind.factory((i) => OrderAttendanceGetAllUsescases(
            repository: i.get<OrderAttendanceRepositoryImpl>())),
        Bind.factory<OrderAttendanceCheckpointDatasource>(
            (i) => OrderAttendanceCheckpointDatasourceImpl()),
        Bind.factory((i) => OrderAttendanceCheckpointRepositoryImpl(
            orderAttendanceCheckpointDatasource:
                i.get<OrderAttendanceCheckpointDatasourceImpl>())),
        Bind.factory((i) => OrderAttendanceCheckpointGetUsescases(
            repository: i.get<OrderAttendanceCheckpointRepositoryImpl>())),
        Bind.factory((i) => OrderAttendanceCheckpointPostUsescases(
            repository: i.get<OrderAttendanceCheckpointRepositoryImpl>())),
        Bind.factory<OrderAttendanceSupplyingDatasource>(
            (i) => OrderAttendanceSupplyingDatasourceImpl()),
        Bind.factory((i) => OrderAttendanceSupplyingRepositoryImpl(
            orderAttendanceSupplyingDatasource:
                i.get<OrderAttendanceSupplyingDatasourceImpl>())),
        Bind.factory((i) => OrderAttendanceSupplyingGetUsescases(
            repository: i.get<OrderAttendanceSupplyingRepositoryImpl>())),
        Bind.factory((i) => OrderAttendanceSupplyingGetlastUsescases(
            repository: i.get<OrderAttendanceSupplyingRepositoryImpl>())),
        Bind.factory((i) => OrderAttendanceSupplyingPostUsescases(
            repository: i.get<OrderAttendanceSupplyingRepositoryImpl>())),

            
        BlocBind.singleton((i) => OrderAttendanceRegisterBloc(
            getOrderAttendance: i.get<OrderAttendanceGetUsescases>(),
            putOrderAttendance: i.get<OrderAttendancePutUsescases>(),
            deleteOrderAttendance: i.get<OrderAttendanceDeleteUsescases>(),
            postOrderAttendance: i.get<OrderAttendancePostUsescases>(),
            getAllOrderAttendance: i.get<OrderAttendanceGetAllUsescases>(),
            getCheckpoint: i.get<OrderAttendanceCheckpointGetUsescases>(),
            postCheckpoint: i.get<OrderAttendanceCheckpointPostUsescases>(),
            getSupplying: i.get<OrderAttendanceSupplyingGetUsescases>(),
            getlastSupplying: i.get<OrderAttendanceSupplyingGetlastUsescases>(),
            postSupplying: i.get<OrderAttendanceSupplyingPostUsescases>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => const OrderAttendanceRegisterPage()),
        ChildRoute('/checkpoint',
            child: (_, args) => const OrderAttendanceCheckpointPage()),
        ChildRoute('/supplying',
            child: (_, args) => const OrderAttendanceSupplyingPage()),
      ];
}
