import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_main_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceRegisterPost
    implements UseCase<OrderAttendanceRegisterMainModel, ParamsOrderAttendanceRegisterPost> {
  final OrderAttendanceRegisterRepository repository;

  OrderAttendanceRegisterPost({required this.repository});

  @override
  Future<Either<Failure, OrderAttendanceRegisterMainModel>> call(
      ParamsOrderAttendanceRegisterPost params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderAttendanceRegisterPost {
  OrderAttendanceRegisterMainModel model;
  ParamsOrderAttendanceRegisterPost({required this.model});
}