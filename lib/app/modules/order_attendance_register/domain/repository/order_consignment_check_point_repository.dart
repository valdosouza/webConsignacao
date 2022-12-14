import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrderConsignmentCheckPointRepository {
  Future<Either<Failure, List<OrderConsignmentCheckPointEntity>>> getConsignments();
  Future<Either<Failure, OrderConsignmentCheckPointEntity>> getConsignment(int id);
  Future<Either<Failure, OrderConsignmentCheckPointEntity>> createConsignment(OrderConsignmentCheckPointEntity consignmentCheckPoint);
  Future<Either<Failure, OrderConsignmentCheckPointEntity>> updateConsignment(int id, OrderConsignmentCheckPointEntity consignmentCheckPoint);
  Future<Either<Failure, void>> deleteConsignment(int id);
}