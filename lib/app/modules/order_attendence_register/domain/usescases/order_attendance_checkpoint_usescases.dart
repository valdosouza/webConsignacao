import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_checkpoint_model.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/repository/order_attendance_checkpoint_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceCheckpointPostUsescases{
  final OrderAttendanceCheckpointRepository repository;

  OrderAttendanceCheckpointPostUsescases({required this.repository});
  Future<Either<Failure, OrderAttendanceCheckpointModel>> call(OrderAttendanceCheckpointModel orderAttendanceCheckpointModel) async {
    return await repository.post(orderAttendanceCheckpointModel);
  }
}