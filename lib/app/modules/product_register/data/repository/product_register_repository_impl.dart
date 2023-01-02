import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/product_register/data/datasource/product_register_datasource.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_main_model.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';
import 'package:appweb/app/modules/product_register/domain/repository/product_register_respository.dart';
import 'package:dartz/dartz.dart';

class ProductRegisterRepositoryImpl implements ProductRegisterRepository {
  final ProductRegisterDataSource datasource;

  ProductRegisterRepositoryImpl({required this.datasource});
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
  Future<Either<Failure, ProductRegisterMainModel>> put(
      {required ProductRegisterMainModel model}) async {
    try {
      final list = await datasource.put(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductRegisterModel>>> getList(
      {required int id}) async {
    try {
      final list = await datasource.getlist(id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductRegisterMainModel>> post(
      {required ProductRegisterMainModel model}) async {
    try {
      final list = await datasource.post(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductRegisterMainModel>> get(
      {required int tbInstitutionId, required int productId}) async {
    try {
      final list = await datasource.get(
          tbInstitutionId: tbInstitutionId, productId: productId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
