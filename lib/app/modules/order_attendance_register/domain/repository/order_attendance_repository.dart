import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderAttendanceRepository {
  Future<Either<Failure, List<OrderAttendanceModel>>> getAttendances();
  Future<Either<Failure, OrderAttendanceModel>> getAttendance(int id);
  Future<Either<Failure, OrderAttendanceModel>> createAttendance(OrderAttendanceModel attendance);
  Future<Either<Failure, OrderAttendanceModel>> updateAttendance(int id, OrderAttendanceModel attendance);
  Future<Either<Failure, void>> deleteAttendance(int id);
}