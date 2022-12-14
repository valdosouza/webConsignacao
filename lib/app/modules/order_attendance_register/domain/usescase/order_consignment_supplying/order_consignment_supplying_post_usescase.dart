import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_supplying_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_supplying_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentSupplyingPostUsesCase implements UseCase<OrderConsignmentSupplyingEntity, OrderConsignmentSupplyingPostParams> {
  final OrderConsignmentSupplyingRepository repository;

  OrderConsignmentSupplyingPostUsesCase(this.repository);

  @override
  Future<Either<Failure, OrderConsignmentSupplyingEntity>> call(OrderConsignmentSupplyingPostParams params) async {
    try {
      return await repository.createConsignment(params.attendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderConsignmentSupplyingPostParams {
  final OrderConsignmentSupplyingEntity attendance;
  OrderConsignmentSupplyingPostParams(this.attendance);
}