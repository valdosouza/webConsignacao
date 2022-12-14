import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_supplying_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrderConsignmentSupplyingRepository {
  Future<Either<Failure, List<OrderConsignmentSupplyingEntity>>> getConsignments();
  Future<Either<Failure, OrderConsignmentSupplyingEntity>> getConsignment(int id);
  Future<Either<Failure, OrderConsignmentSupplyingEntity>> createConsignment(OrderConsignmentSupplyingEntity consignmentSupplying);
  Future<Either<Failure, OrderConsignmentSupplyingEntity>> updateConsignment(int id, OrderConsignmentSupplyingEntity consignmentSupplying);
  Future<Either<Failure, void>> deleteConsignment(int id);
}