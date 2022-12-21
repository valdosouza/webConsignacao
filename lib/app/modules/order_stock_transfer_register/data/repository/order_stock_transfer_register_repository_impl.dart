import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/datasource/order_stock_transfer_register_datasource.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterRepositoryImpl
    implements OrderStockTransferRegisterRepository {
  final OrderStockTransferRegisterDataSource datasource;

  OrderStockTransferRegisterRepositoryImpl({required this.datasource});
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
  Future<Either<Failure, OrderStockTransferRegisterOrderModel>> put(
      {required OrderStockTransferRegisterOrderModel model}) async {
    try {
      final list = await datasource.put(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderStockTransferRegisterOrderModel>>> getList(
      {required int id}) async {
    try {
      final list = await datasource.getlist(id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderStockTransferRegisterOrderModel>> post(
      {required OrderStockTransferRegisterOrderModel model}) async {
    try {
      final list = await datasource.post(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderStockTransferRegisterOrderModel>> get({
    required int intitutionId,
    required int orderStockId,
  }) async {
    try {
      final list = await datasource.get(
        institutionId: intitutionId,
        orderStockId: orderStockId,
      );
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<StockListModel>>> getListStock(
      {required int institutionId}) async {
    try {
      final list = await datasource.getListStock(institutionId: institutionId);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CustomerListModel>>> getListEntity(
      {required int institutionId}) async {
    try {
      final list = await datasource.getListEntity(institutionId: institutionId);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
