import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/datasource/order_sale_register_datasource.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_respository.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

class OrderSaleRegisterRepositoryImpl implements OrderSaleRegisterRepository {
  final OrderSaleRegisterDataSource datasource;

  OrderSaleRegisterRepositoryImpl({required this.datasource});
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
  Future<Either<Failure, OrderSaleListModel>> put(
      {required OrderSaleMainModel model}) async {
    try {
      final list = await datasource.put(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderSaleListModel>>> getList() async {
    try {
      final list = await datasource.getlist();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderSaleListModel>> post(
      {required OrderSaleMainModel model}) async {
    try {
      final list = await datasource.post(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductListModel>>> getListProducts() async {
    try {
      final list = await datasource.getListProduct();

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<StockListModel>>> getListStock() async {
    try {
      final list = await datasource.getListStock();

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<EntityListModel>>> getListEntities() async {
    try {
      final list = await datasource.getListEntity();

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderSaleMainModel>> get(
      {required int orderId}) async {
    try {
      final list = await datasource.get(orderStockId: orderId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> closure(
      {required OrderStatusModel model}) async {
    try {
      final result = await datasource.closure(model: model);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> reopen(
      {required OrderStatusModel model}) async {
    try {
      final result = await datasource.reopen(model: model);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
