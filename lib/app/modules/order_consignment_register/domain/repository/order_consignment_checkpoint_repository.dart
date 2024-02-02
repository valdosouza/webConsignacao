import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderConsignmentCheckpointRepository {
  Future<Either<Failure, OrderConsignmentCheckpointModel>> post(
      OrderConsignmentCheckpointModel orderAttendanceCheckpoint);

  Future<Either<Failure, String>> delete(int tbOrderId);
}
