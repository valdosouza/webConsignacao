import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_main_model.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderAttendanceRegisterRepository {
  Future<Either<Failure, List<OrderAttendanceRegisterModel>>> getList(
      {required int id});
  Future<Either<Failure, OrderAttendanceRegisterMainModel>> get(
      {required int id});
  Future<Either<Failure, OrderAttendanceRegisterMainModel>> post(
      {required OrderAttendanceRegisterMainModel model});
  Future<Either<Failure, OrderAttendanceRegisterMainModel>> put(
      {required OrderAttendanceRegisterMainModel model});
  Future<Either<Failure, String>> delete({required int id});
}