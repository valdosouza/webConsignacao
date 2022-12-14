import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_check_point_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_check_point_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentCheckPointPutUseCase implements UseCase<OrderConsignmentCheckPointEntity, OrderConsignmentCheckPointUpdateParams> {
  final OrderConsignmentCheckPointRepository repository;

  OrderConsignmentCheckPointPutUseCase(this.repository);

  @override
  Future<Either<Failure, OrderConsignmentCheckPointEntity>> call(OrderConsignmentCheckPointUpdateParams params) async {
    try {
      return await repository.updateConsignment(params.id, params.attendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderConsignmentCheckPointUpdateParams {
  final int id;
  final OrderConsignmentCheckPointModel attendance;
  OrderConsignmentCheckPointUpdateParams(this.id, this.attendance);
}