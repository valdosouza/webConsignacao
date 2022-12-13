import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/data/datasource/order_attendance_register_datasource.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_main_model.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:dartz/dartz.dart';

class OrderAttendanceRegisterRepositoryImpl implements OrderAttendanceRegisterRepository {
  final OrderAttendanceRegisterDataSource datasource;

  OrderAttendanceRegisterRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, String>> delete({required int id}) async {
    try {
      final list = await datasource.delete(id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceRegisterMainModel>> put(
      {required OrderAttendanceRegisterMainModel model}) async {
    try {
      final list = await datasource.put(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderAttendanceRegisterModel>>> getList(
      {required int id}) async {
    try {
      final list = await datasource.getlist(id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceRegisterMainModel>> post(
      {required OrderAttendanceRegisterMainModel model}) async {
    try {
      final list = await datasource.post(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceRegisterMainModel>> get(
      {required int id}) async {
    try {
      final list = await datasource.get(
          id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
