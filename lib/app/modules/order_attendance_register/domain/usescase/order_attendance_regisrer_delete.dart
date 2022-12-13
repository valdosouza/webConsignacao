import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceRegisterDelete
    implements UseCase<String, ParamsOrderAttendanceRegisterDelete> {
  final OrderAttendanceRegisterRepository repository;

  OrderAttendanceRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsOrderAttendanceRegisterDelete params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderAttendanceRegisterDelete {
  int id;
  ParamsOrderAttendanceRegisterDelete({required this.id});
}