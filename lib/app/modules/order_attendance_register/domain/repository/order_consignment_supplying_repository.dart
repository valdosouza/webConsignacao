import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_supplying_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderConsignmentSupplyingRepository {
  Future<Either<Failure, List<OrderConsignmentSupplyingModel>>> getConsignments();
  Future<Either<Failure, OrderConsignmentSupplyingModel>> getConsignment(int id);
  Future<Either<Failure, OrderConsignmentSupplyingModel>> createConsignment(OrderConsignmentSupplyingModel consignmentSupplying);
  Future<Either<Failure, OrderConsignmentSupplyingModel>> updateConsignment(int id, OrderConsignmentSupplyingModel consignmentSupplying);
  Future<Either<Failure, void>> deleteConsignment(int id);
}