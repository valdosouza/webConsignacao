import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_check_point_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentCheckPointGetAllUsescase
    implements UseCase<List<OrderConsignmentCheckPointEntity>, NoParams> {
  final OrderConsignmentCheckPointRepository repository;

  OrderConsignmentCheckPointGetAllUsescase(this.repository);

  @override
  Future<Either<Failure, List<OrderConsignmentCheckPointEntity>>> call(NoParams params) async {
    try{
      return await repository.getConsignments();
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
