import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceGetUsescase implements UseCase<OrderAttendanceEntity, OrderAttendanceGetParams> {
  final OrderAttendanceRepository repository;

  OrderAttendanceGetUsescase(this.repository);

  @override
  Future<Either<Failure, OrderAttendanceEntity>> call(OrderAttendanceGetParams params) async {
    try {
      return await repository.getAttendance(params.id);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderAttendanceGetParams {
  final int id;
  OrderAttendanceGetParams(this.id);
}