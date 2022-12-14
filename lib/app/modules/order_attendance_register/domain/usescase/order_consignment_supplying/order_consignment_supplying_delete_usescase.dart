import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_supplying_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentSupplyingDeleteUsesCase implements UseCase<void, OrderConsignmentSupplyingDeleteParams> {
  final OrderConsignmentSupplyingRepository repository;

  OrderConsignmentSupplyingDeleteUsesCase(this.repository);

  @override
  Future<Either<Failure, void>> call(OrderConsignmentSupplyingDeleteParams params) async {
    try {
      return await repository.deleteConsignment(params.id);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderConsignmentSupplyingDeleteParams {
  final int id;
  OrderConsignmentSupplyingDeleteParams(this.id);
}