import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendancePostUsesCase implements UseCase<OrderAttendanceEntity, OrderAttendancePostParams> {
  final OrderAttendanceRepository repository;

  OrderAttendancePostUsesCase(this.repository);

  @override
  Future<Either<Failure, OrderAttendanceEntity>> call(OrderAttendancePostParams params) async {
    try {
      return await repository.createAttendance(params.attendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderAttendancePostParams {
  final OrderAttendanceEntity attendance;
  OrderAttendancePostParams(this.attendance);
}