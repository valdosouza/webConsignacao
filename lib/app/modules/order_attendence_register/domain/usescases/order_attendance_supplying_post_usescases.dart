import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_supplying_model.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/repository/order_attendance_supplying_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceSupplyingPostUsescases{
  final OrderAttendanceSupplyingRepository repository;

  OrderAttendanceSupplyingPostUsescases({required this.repository});
  Future<Either<Failure, OrderAttendanceSupplyingModel>> call(OrderAttendanceSupplyingModel orderAttendanceSupplyingModel) async {
    return await repository.post(orderAttendanceSupplyingModel);
  }
}