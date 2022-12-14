import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_supplying_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_supplying_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentSupplyingGetAllUsescase
    implements UseCase<List<OrderConsignmentSupplyingEntity>, NoParams> {
  final OrderConsignmentSupplyingRepository repository;

  OrderConsignmentSupplyingGetAllUsescase(this.repository);

  @override
  Future<Either<Failure, List<OrderConsignmentSupplyingEntity>>> call(NoParams params) async {
    try{
      return await repository.getConsignments();
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
