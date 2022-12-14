import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/data/datasource/order_consignment_check_point_datasource.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_check_point_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_check_point_repository.dart';
import 'package:dartz/dartz.dart';


class OrderConsignmentCheckPointRepositoryImpl implements OrderConsignmentCheckPointRepository{
  final OrderConsignmentCheckPointDataSource dataSource;
  OrderConsignmentCheckPointRepositoryImpl({required this.dataSource});

  @override
  Future<
      Either<Failure, List<OrderConsignmentCheckPointModel>>> getConsignments() async {
    try {
      final list = await dataSource.getOrderConsignmentCheckPointList();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderConsignmentCheckPointModel>> getConsignment(
      int id) async {
    try {
      final consignment = await dataSource.getOrderConsignmentCheckPoint(id);
      return Right(consignment);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderConsignmentCheckPointModel>> createConsignment(
      OrderConsignmentCheckPointModel consignment) async {
    try {
      await dataSource.addOrderConsignmentCheckPoint(consignment);
      return Right(consignment);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderConsignmentCheckPointModel>> updateConsignment(int id,
      OrderConsignmentCheckPointModel consignment) async {
    try {
      await dataSource.updateOrderConsignmentCheckPoint(consignment);
      return Right(consignment);
    } on ServerException {
      return Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, void>> deleteConsignment(
      int id) async {
    try {
      await dataSource.deleteOrderConsignmentCheckPoint(id);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}