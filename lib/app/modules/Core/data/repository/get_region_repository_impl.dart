import 'package:appweb/app/modules/Core/data/datasource/get_region_datasource.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_region_repository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetRegionRepositoryImpl implements GetRegionRepository {
  final GetRegionDatasource datasource;

  GetRegionRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<RegionModel>>> getregion() async {
    try {
      final response = await datasource.getRegion();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
