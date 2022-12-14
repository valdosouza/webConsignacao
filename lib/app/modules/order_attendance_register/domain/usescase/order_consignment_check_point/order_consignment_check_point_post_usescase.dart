import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_check_point_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentCheckPointPostUsesCase implements UseCase<OrderConsignmentCheckPointEntity, OrderConsignmentCheckPointPostParams> {
  final OrderConsignmentCheckPointRepository repository;

  OrderConsignmentCheckPointPostUsesCase(this.repository);

  @override
  Future<Either<Failure, OrderConsignmentCheckPointEntity>> call(OrderConsignmentCheckPointPostParams params) async {
    try {
      return await repository.createConsignment(params.attendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderConsignmentCheckPointPostParams {
  final OrderConsignmentCheckPointEntity attendance;
  OrderConsignmentCheckPointPostParams(this.attendance);
}