import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrderAttendanceRepository {
  Future<Either<Failure, List<OrderAttendanceEntity>>> getAttendances();
  Future<Either<Failure, OrderAttendanceEntity>> getAttendance(int id);
  Future<Either<Failure, OrderAttendanceEntity>> createAttendance(OrderAttendanceEntity attendance);
  Future<Either<Failure, OrderAttendanceEntity>> updateAttendance(int id, OrderAttendanceEntity attendance);
  Future<Either<Failure, void>> deleteAttendance(int id);
}