import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceGetAllUsescase
    implements UseCase<List<OrderAttendanceEntity>, NoParams> {
  final OrderAttendanceRepository repository;

  OrderAttendanceGetAllUsescase(this.repository);

  @override
  Future<Either<Failure, List<OrderAttendanceEntity>>> call(NoParams params) async {
    try{
      return await repository.getAttendances();
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
