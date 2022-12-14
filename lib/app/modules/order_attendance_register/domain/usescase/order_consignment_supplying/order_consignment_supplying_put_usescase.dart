import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_supplying_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_supplying_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentSupplyingPutUsesCase implements UseCase<OrderConsignmentSupplyingEntity, OrderConsignmentSupplyingUpdateParams> {
  final OrderConsignmentSupplyingRepository repository;

  OrderConsignmentSupplyingPutUsesCase(this.repository);

  @override
  Future<Either<Failure, OrderConsignmentSupplyingEntity>> call(OrderConsignmentSupplyingUpdateParams params) async {
    try {
      return await repository.updateConsignment(params.id, params.attendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderConsignmentSupplyingUpdateParams {
  final int id;
  final OrderConsignmentSupplyingModel attendance;
  OrderConsignmentSupplyingUpdateParams(this.id, this.attendance);
}