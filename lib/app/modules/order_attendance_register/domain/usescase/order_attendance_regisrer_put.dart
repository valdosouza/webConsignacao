import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_main_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceRegisterPut
    implements UseCase<OrderAttendanceRegisterMainModel, ParamsOrderAttendanceRegisterPut> {
  final OrderAttendanceRegisterRepository repository;

  OrderAttendanceRegisterPut({required this.repository});

  @override
  Future<Either<Failure, OrderAttendanceRegisterMainModel>> call(
      ParamsOrderAttendanceRegisterPut params) async {
    try {
      final list = await repository.put(model: params.model);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderAttendanceRegisterPut {
  OrderAttendanceRegisterMainModel model;
  ParamsOrderAttendanceRegisterPut({required this.model});
}