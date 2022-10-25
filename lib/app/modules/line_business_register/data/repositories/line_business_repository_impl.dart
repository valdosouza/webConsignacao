import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/line_business_register/data/datasource/remote/ownapi/line_business_data_source.dart';
import 'package:appweb/app/modules/line_business_register/domain/repositories/line_business_repository.dart';

class LineBusinessRepositoryImpl extends LineBusinessRepository {
  final LineBusinessDataSource dataSource;
  LineBusinessRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, String>> addLineBusiness(
      {required LineBusinessModel lineBusinessModel}) async {
    try {
      final result =
          await dataSource.postLineBusiness(lineBusinessModel: lineBusinessModel);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteLineBusiness(
      {required int lineBusinessId}) async {
    try {
      final result =
          await dataSource.deleteLineBusiness(lineBusinessId: lineBusinessId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<LineBusinessModel>>> getListLineBusiness(
      {required int institutionId}) async {
    try {
      final result = await dataSource.getlist(idInstitution: "1");
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> putLineBusiness(
      {required LineBusinessModel lineBusinessModel}) async {
    try {
      final result =
          await dataSource.putLineBusiness(lineBusinessModel: lineBusinessModel);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
