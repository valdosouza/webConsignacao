import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendence_register/data/datasources/order_attendance_supplying_datasources.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/repository/order_attendance_supplying_repository.dart';
import 'package:dartz/dartz.dart';

import '../models/order_attendance_supplying_model.dart';

class OrderAttendanceSupplyingRepositoryImpl implements OrderAttendanceSupplyingRepository {
  final OrderAttendanceSupplyingDatasource orderAttendanceSupplyingDatasource;

  OrderAttendanceSupplyingRepositoryImpl({required this.orderAttendanceSupplyingDatasource});

  @override
  Future<Either<Failure, OrderAttendanceSupplyingModel>> get(
      int tbInstitutionId, int id) async {
    try {
      return Right(await orderAttendanceSupplyingDatasource.get(tbInstitutionId, id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceSupplyingModel>> post(
      OrderAttendanceSupplyingModel model) async {
    try {
      return Right(await orderAttendanceSupplyingDatasource.post(model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderAttendanceSupplyingModel>> getlast(
      int tbInstitutionId, int tbOrderAttendanceId) async {
    try {
      return Right(await orderAttendanceSupplyingDatasource.getlast(tbInstitutionId, tbOrderAttendanceId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}