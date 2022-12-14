import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_attendance_register/data/datasource/order_consignment_supplying_datasource.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_consignment_supplying_repository.dart';
import 'package:dartz/dartz.dart';


class OrderConsignmentSupplyingRepositoryImpl implements OrderConsignmentSupplyingRepository{
  final OrderConsignmentSupplyingDataSource dataSource;
  OrderConsignmentSupplyingRepositoryImpl({required this.dataSource});

  @override
  Future<
      Either<Failure, List<OrderConsignmentSupplyingModel>>> getConsignments() async {
    try {
      final list = await dataSource.getOrderConsignmentSupplyingList();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderConsignmentSupplyingModel>> getConsignment(
      int id) async {
    try {
      final Consignment = await dataSource.getOrderConsignmentSupplying(id);
      return Right(Consignment);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderConsignmentSupplyingModel>> createConsignment(
      OrderConsignmentSupplyingModel consignment) async {
    try {
      await dataSource.addOrderConsignmentSupplying(consignment);
      return Right(consignment);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderConsignmentSupplyingModel>> updateConsignment(int id,
      OrderConsignmentSupplyingModel consignment) async {
    try {
      await dataSource.updateOrderConsignmentSupplying(consignment);
      return Right(consignment);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteConsignment(
      int id) async {
    try {
      await dataSource.deleteOrderConsignmentSupplying(id);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}