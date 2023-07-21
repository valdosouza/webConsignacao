import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_bonus_register/data/datasource/order_bonus_register_datasource.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/repository/order_bonus_register_respository.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

class OrderBonusRegisterRepositoryImpl implements OrderBonusRegisterRepository {
  final OrderBonusRegisterDataSource datasource;

  OrderBonusRegisterRepositoryImpl({required this.datasource});
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
  Future<Either<Failure, OrderBonusRegisterModel>> put(
      {required OrderBonusRegisterModel model}) async {
    try {
      final list = await datasource.put(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderBonusRegisterModel>>> getList() async {
    try {
      final list = await datasource.getlist();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderBonusRegisterModel>> post(
      {required OrderBonusRegisterModel model}) async {
    try {
      final list = await datasource.post(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderBonusRegisterModel>> get(
      {required int productId}) async {
    try {
      final list = await datasource.get(orderBonusId: productId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductListModel>>> getListProducts() async {
    try {
      final list = await datasource.getListProducts();

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
      final list = await datasource.getListEtities();

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
