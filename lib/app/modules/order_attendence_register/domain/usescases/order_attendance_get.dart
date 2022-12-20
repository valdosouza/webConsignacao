import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceGet {
  final OrderAttendanceRepository repository;

  OrderAttendanceGet({required this.repository});

  Future<Either<Failure, OrderAttendanceModel>> call(
      int tbInstitutionId, int id) async {
    return await repository.get(tbInstitutionId, id);
  }
}
