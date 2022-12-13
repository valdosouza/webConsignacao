import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_main_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceRegisterGet
    implements UseCase<OrderAttendanceRegisterMainModel, ParamsGetOrderAttendanceRegisterGet> {
  final OrderAttendanceRegisterRepository repository;

  OrderAttendanceRegisterGet({required this.repository});

  @override
  Future<Either<Failure, OrderAttendanceRegisterMainModel>> call(
      ParamsGetOrderAttendanceRegisterGet params) async {
    try {
      final list = await repository.get(
          id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetOrderAttendanceRegisterGet {
  int id;
  ParamsGetOrderAttendanceRegisterGet({required this.id});
}
