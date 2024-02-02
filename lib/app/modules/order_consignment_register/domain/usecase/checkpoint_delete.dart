import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/repository/order_consignment_checkpoint_repository.dart';
import 'package:dartz/dartz.dart';

class CheckpointDelete {
  final OrderConsignmentCheckpointRepository repository;

  CheckpointDelete({required this.repository});
  Future<Either<Failure, String>> call(int tbOrderId) async {
    return await repository.delete(tbOrderId);
  }
}
