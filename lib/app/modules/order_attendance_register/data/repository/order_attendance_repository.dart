import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/data/datasource/order_attendance_datasource.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';


class OrderAttendanceRepositoryImpl implements OrderAttendanceRepository{
  final OrderAttendanceDataSource dataSource;
  OrderAttendanceRepositoryImpl({required this.dataSource});

  @override
  Future<
      Either<Failure, List<OrderAttendanceModel>>> getAttendances() async {
    try {
      final list = await dataSource.getOrderAttendanceList();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> getAttendance(
      int id) async {
    try {
      final attendance = await dataSource.getOrderAttendance(id);
      return Right(attendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> createAttendance(
      OrderAttendanceModel attendance) async {
    try {
      await dataSource.addOrderAttendance(attendance);
      return Right(attendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceModel>> updateAttendance(int id,
      OrderAttendanceModel attendance) async {
    try {
      await dataSource.updateOrderAttendance(attendance);
      return Right(attendance);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAttendance(
      int id) async {
    try {
      await dataSource.deleteOrderAttendance(id);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}