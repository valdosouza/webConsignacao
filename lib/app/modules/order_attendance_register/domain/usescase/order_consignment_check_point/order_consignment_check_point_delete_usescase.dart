import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_check_point_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentCheckPointDeleteUsesCase implements UseCase<void, OrderConsignmentCheckPointDeleteParams> {
  final OrderConsignmentCheckPointRepository repository;

  OrderConsignmentCheckPointDeleteUsesCase(this.repository);

  @override
  Future<Either<Failure, void>> call(OrderConsignmentCheckPointDeleteParams params) async {
    try {
      return await repository.deleteConsignment(params.id);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderConsignmentCheckPointDeleteParams {
  final int id;
  OrderConsignmentCheckPointDeleteParams(this.id);
}