import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceDeleteUsesCase implements UseCase<void, OrderAttendanceDeleteParams> {
  final OrderAttendanceRepository repository;

  OrderAttendanceDeleteUsesCase(this.repository);

  @override
  Future<Either<Failure, void>> call(OrderAttendanceDeleteParams params) async {
    try {
      return await repository.deleteAttendance(params.id);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class OrderAttendanceDeleteParams {
  final int id;
  OrderAttendanceDeleteParams(this.id);
}