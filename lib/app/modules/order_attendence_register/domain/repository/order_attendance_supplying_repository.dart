import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_supplying_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderAttendanceSupplyingRepository{
  Future<Either<Failure, OrderAttendanceSupplyingModel>> get(int tbInstitutionId, int id);
  Future<Either<Failure, OrderAttendanceSupplyingModel>> post(OrderAttendanceSupplyingModel orderAttendanceSupplyingModel);
  Future<Either<Failure, OrderAttendanceSupplyingModel>> getlast(int tbInstitutionId, int id);

}