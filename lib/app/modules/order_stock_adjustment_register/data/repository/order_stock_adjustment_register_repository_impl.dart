import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/datasource/order_stock_adjustment_register_datasource.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockAdjustmentRegisterRepositoryImpl
    implements OrderStockAdjustmentRegisterRepository {
  final OrderStockAdjustmentRegisterDataSource datasource;

  OrderStockAdjustmentRegisterRepositoryImpl({required this.datasource});
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
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> put(
      {required OrderStockAdjustmentRegisterModel model}) async {
    try {
      final list = await datasource.put(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderStockAdjustmentRegisterModel>>> getList(
      {required int id}) async {
    try {
      final list = await datasource.getlist(id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> post(
      {required OrderStockAdjustmentRegisterModel model}) async {
    try {
      final list = await datasource.post(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> get(
      {required int tbInstitutionId, required int productId}) async {
    try {
      final list = await datasource.get(
          institutionId: tbInstitutionId, orderStockAdjustmentId: productId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getListProducts(
      {required int id}) async {
    try {
      final list = await datasource.getListProducts(institutionId: id);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<StockListModel>>> getListStock(
      {required int id}) async {
    try {
      final list = await datasource.getListStock(institutionId: id);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<EntityListModel>>> getListEntities() async {
    try {
      final list = await datasource.getListEtities();

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
