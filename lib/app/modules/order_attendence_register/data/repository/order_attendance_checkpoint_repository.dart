import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendence_register/data/datasources/order_attendance_checkpoint.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_checkpoint_model.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/repository/order_attendance_checkpoint_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceCheckpointRepositoryImpl implements OrderAttendanceCheckpointRepository{
  final OrderAttendanceCheckpointDatasource orderAttendanceCheckpointDatasource;

  OrderAttendanceCheckpointRepositoryImpl({required this.orderAttendanceCheckpointDatasource});

  @override
  Future<Either<Failure, OrderAttendanceCheckpointModel>> get(int tbInstitutionId, int id) async {
    try{
      return Right(await orderAttendanceCheckpointDatasource.get(tbInstitutionId, id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceCheckpointModel>> post(OrderAttendanceCheckpointModel model) async{
    try{
      return Right(await orderAttendanceCheckpointDatasource.post(model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}