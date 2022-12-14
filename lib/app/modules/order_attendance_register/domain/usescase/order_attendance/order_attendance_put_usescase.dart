import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendancePutUsesCase implements UseCase<OrderAttendanceEntity, OrderAttendanceUpdateParams> {
  final OrderAttendanceRepository repository;

  OrderAttendancePutUsesCase(this.repository);

  @override
  Future<Either<Failure, OrderAttendanceEntity>> call(OrderAttendanceUpdateParams params) async {
    try {
      return await repository.updateAttendance(params.id, params.attendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderAttendanceUpdateParams {
  final int id;
  final OrderAttendanceModel attendance;
  OrderAttendanceUpdateParams(this.id, this.attendance);
}