import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceGetAll {
  final OrderAttendanceRepository repository;

  OrderAttendanceGetAll({required this.repository});

  Future<Either<Failure, List<OrderAttendanceModel>>> call(
      int tbInstitutionId) async {
    return await repository.getAll();
  }
}
