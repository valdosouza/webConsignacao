import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_production_register/data/datasource/order_production_register_datasource.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderProductionRegisterRepositoryImpl
    implements OrderProductionRegisterRepository {
  final OrderProductionRegisterDatasource datasource;

  OrderProductionRegisterRepositoryImpl({required this.datasource});

  // @override
  // Future<Either<Failure, String>> delete({required int id}) async {
  //   try {
  //     final list = await datasource.delete(id: id);
  //     return Right(list);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, ProductRegisterMainModel>> put(
  //     {required ProductRegisterMainModel model}) async {
  //   try {
  //     final list = await datasource.put(model: model);
  //     return Right(list);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  @override
  Future<Either<Failure, List<OrderProductionModel>>> getList(
      {required int id}) async {
    try {
      final list = await datasource.getlist(institutionId: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  // @override
  // Future<Either<Failure, ProductRegisterMainModel>> post(
  //     {required ProductRegisterMainModel model}) async {
  //   try {
  //     final list = await datasource.post(model: model);
  //     return Right(list);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, ProductRegisterMainModel>> get(
  //     {required int intitutionId, required int productId}) async {
  //   try {
  //     final list = await datasource.get(
  //         intitutionId: intitutionId, productId: productId);
  //     return Right(list);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
}
