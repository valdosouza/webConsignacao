import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/line_business_register/data/datasource/remote/ownapi/line_business_data_source.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/repository/line_business_repository.dart';
import 'package:dartz/dartz.dart';

class LineBusinessRepositoryImpl implements LineBusinessRepository {
  final LineBusinessDatasource datasource;
  //final NetworkInfo networkinfo;
  LineBusinessRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<LineBusinessModel>>> getList(
      {required int institutionId}) async {
    try {
      final list = await datasource.getlist(institutionId: institutionId);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LineBusinessModel>> post(
      {required LineBusinessModel model}) async {
    try {
      final result = await datasource.post(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete({required int lineBusinessId}) async {
    try {
      final result = await datasource.delete(id: lineBusinessId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> put(
      {required LineBusinessModel model}) async {
    try {
      final result = await datasource.put(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
