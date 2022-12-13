import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceRegisterGetlist
    implements
        UseCase<List<OrderAttendanceRegisterModel>, ParamsOrderAttendanceRegisterGetlist> {
  final OrderAttendanceRegisterRepository repository;

  OrderAttendanceRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<OrderAttendanceRegisterModel>>> call(
      ParamsOrderAttendanceRegisterGetlist params) async {
    try {
      final list = await repository.getList(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderAttendanceRegisterGetlist {
  int id;
  ParamsOrderAttendanceRegisterGetlist({required this.id});
}
