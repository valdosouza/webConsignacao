import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class OrderAttendanceRepository {
  Future<Either<Failure, List<OrderAttendanceModel>>> getAll(
      int tbInstitutionId);
  Future<Either<Failure, OrderAttendanceModel>> get(
      int tbInstitutionId, int id);
  Future<Either<Failure, OrderAttendanceModel>> put(
      OrderAttendanceModel orderAttendanceModel);
  Future<Either<Failure, OrderAttendanceModel>> delete(
      int tbInstitutionId, int id);
  Future<Either<Failure, OrderAttendanceModel>> post(
      OrderAttendanceModel orderAttendanceModel);
}
