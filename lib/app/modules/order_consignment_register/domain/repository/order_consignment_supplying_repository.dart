import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/entity/order_consignment_supplying_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrderConsignmentSupplyingRepository {
  Future<Either<Failure, OrderConsignmentSupplyingEntity>> post(
      OrderConsignmentSupplyingModel orderAttendanceSupplyingModel);
  Future<Either<Failure, OrderConsignmentSupplyingModel>> getlast(
      int tbCustomerId);
}
