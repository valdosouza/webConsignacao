import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';

import 'package:appweb/app/modules/order_consignment_register/domain/repository/order_consignment_checkpoint_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentCheckpointPost {
  final OrderConsignmentCheckpointRepository repository;

  OrderConsignmentCheckpointPost({required this.repository});
  Future<Either<Failure, OrderConsignmentCheckpointModel>> call(
      OrderConsignmentCheckpointModel orderConsignmentCheckpointModel) async {
    return await repository.post(orderConsignmentCheckpointModel);
  }
}
