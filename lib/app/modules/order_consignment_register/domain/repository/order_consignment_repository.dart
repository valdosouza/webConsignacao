import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderConsignmentRepository {
  Future<Either<Failure, List<OrderConsignmetListModel>>> getlist(
      int tbCustomerId);
  Future<Either<Failure, OrderConsignmentCheckpointModel>> getCheckpoint(
      int tbOrderId);
  Future<Either<Failure, OrderConsignmentSupplyingModel>> getSupplying(
      int tbOrderId);
}
