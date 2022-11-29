import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/line_business_register/data/datasource/remote/ownapi/linebusiness_register_datasource.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/repository/linebusiness_register_repository.dart';
import 'package:dartz/dartz.dart';

class LinebusinessRegisterRepositoryImpl
    implements LinebusinessRegisterRepository {
  final LinebusinessRegisterDataSource datasource;

  //final NetworkInfo networkinfo;
  LinebusinessRegisterRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<LinebusinessModel>>> getList(
      {required int institutionId}) async {
    try {
      final list = await datasource.getlist(institutionId: institutionId);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LinebusinessModel>> post(
      {required LinebusinessModel model}) async {
    try {
      final result = await datasource.post(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete({required int id}) async {
    try {
      final result = await datasource.delete(id: id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LinebusinessModel>> put(
      {required LinebusinessModel model}) async {
    try {
      final result = await datasource.put(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
