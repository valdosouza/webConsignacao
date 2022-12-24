import 'package:appweb/app/modules/order_attendence_register/data/datasources/order_attendance_datasource.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/order_attendance_repository.dart';

class OrderAttendanceRepositoryImpl implements OrderAttendanceRepository {
  final OrderAttendanceDatasource orderAttendanceDatasource;

  OrderAttendanceRepositoryImpl({required this.orderAttendanceDatasource});

  @override
  Future<Either<Failure, List<OrderAttendanceModel>>> getAll(
      int tbInstitutionId) async {
    try {
      final List<OrderAttendanceModel> orderAttendance =
          await orderAttendanceDatasource.getAll(tbInstitutionId);
      return Right(orderAttendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> delete(
      int tbInstitutionId, int id) async {
    try {
      return Right(await orderAttendanceDatasource.delete(tbInstitutionId, id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> get(
      int tbInstitutionId, int id) async {
    try {
      return Right(await orderAttendanceDatasource.get(tbInstitutionId, id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> post(
      OrderAttendanceModel model) async {
    try {
      return Right(await orderAttendanceDatasource.post(model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> put(
      OrderAttendanceModel model) async {
    try {
      return Right(await orderAttendanceDatasource.put(model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
