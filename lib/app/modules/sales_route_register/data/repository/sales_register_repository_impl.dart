import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/modules/sales_route_register/data/datasource/remote/ownapi/sales_data_source.dart';
import 'package:appweb/app/modules/sales_route_register/data/models/sales_model.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/sales_route_register/domain/repository/sales_register_repository.dart';
import 'package:dartz/dartz.dart';

class SalesRepositoryImpl implements SalesRepository {
  final SalesDataSource datasource;

  SalesRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, SalesModel>> post({
    required SalesModel model,
  }) async {
    try {
      final result = await datasource.post(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<SalesModel>>> getList(
      {required int institutionId}) async {
    try {
      final list = await datasource.getlist(institutionId: institutionId);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete({required int institutionId}) async {
    try {
      final result = await datasource.delete(id: institutionId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> put({required SalesModel model}) async {
    try {
      final result = await datasource.put(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
