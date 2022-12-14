import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_supplying_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_supplying_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentSupplyingGetUsescase implements UseCase<OrderConsignmentSupplyingEntity, OrderConsignmentSupplyingGetParams> {
  final OrderConsignmentSupplyingRepository repository;

  OrderConsignmentSupplyingGetUsescase(this.repository);

  @override
  Future<Either<Failure, OrderConsignmentSupplyingEntity>> call(OrderConsignmentSupplyingGetParams params) async {
    try {
      return await repository.getConsignment(params.id);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderConsignmentSupplyingGetParams {
  final int id;
  OrderConsignmentSupplyingGetParams(this.id);
}