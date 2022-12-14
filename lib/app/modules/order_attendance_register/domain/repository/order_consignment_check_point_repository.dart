import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_check_point_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderConsignmentCheckPointRepository {
  Future<Either<Failure, List<OrderConsignmentCheckPointModel>>> getConsignments();
  Future<Either<Failure, OrderConsignmentCheckPointModel>> getConsignment(int id);
  Future<Either<Failure, OrderConsignmentCheckPointModel>> createConsignment(OrderConsignmentCheckPointModel consignmentCheckPoint);
  Future<Either<Failure, OrderConsignmentCheckPointModel>> updateConsignment(int id, OrderConsignmentCheckPointModel consignmentCheckPoint);
  Future<Either<Failure, void>> deleteConsignment(int id);
}