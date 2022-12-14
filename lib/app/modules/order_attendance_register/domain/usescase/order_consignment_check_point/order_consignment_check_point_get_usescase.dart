import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_check_point_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentCheckPointGetUsescase implements UseCase<OrderConsignmentCheckPointEntity, OrderConsignmentCheckPointGetParams> {
  final OrderConsignmentCheckPointRepository repository;

  OrderConsignmentCheckPointGetUsescase(this.repository);

  @override
  Future<Either<Failure, OrderConsignmentCheckPointEntity>> call(OrderConsignmentCheckPointGetParams params) async {
    try {
      return await repository.getConsignment(params.id);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderConsignmentCheckPointGetParams {
  final int id;
  OrderConsignmentCheckPointGetParams(this.id);
}