import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_checkpoint_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderAttendanceCheckpointRepository{
  Future<Either<Failure, OrderAttendanceCheckpointModel>> get(int tbInstitutionId, int id);
  Future<Either<Failure, OrderAttendanceCheckpointModel>> post(OrderAttendanceCheckpointModel orderAttendanceCheckpointModel);
}