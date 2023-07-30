import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/repository/order_consignment_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentGetCheckpoint {
  final OrderConsignmentRepository repository;

  OrderConsignmentGetCheckpoint({required this.repository});
  Future<Either<Failure, OrderConsignmentCheckpointModel>> call(
      int tbOrderId) async {
    return await repository.getCheckpoint(tbOrderId);
  }
}
