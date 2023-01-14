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
  Future<Either<Failure, List<OrderAttendanceModel>>> getAll() async {
    try {
      final List<OrderAttendanceModel> orderAttendance =
          await orderAttendanceDatasource.getAll();
      return Right(orderAttendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> delete(int id) async {
    try {
      return Right(await orderAttendanceDatasource.delete(id: id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> get(int id) async {
    try {
      return Right(await orderAttendanceDatasource.get(id: id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> post(
      OrderAttendanceModel model) async {
    try {
      return Right(await orderAttendanceDatasource.post(model: model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> put(
      OrderAttendanceModel model) async {
    try {
      return Right(await orderAttendanceDatasource.put(model: model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
