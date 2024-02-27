import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_region_repository.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetRegion implements UseCase<List<RegionModel>, ParamsRegionListGet> {
  final GetRegionRepository repository;

  GetRegion({required this.repository});

  @override
  Future<Either<Failure, List<RegionModel>>> call(
      ParamsRegionListGet params) async {
    try {
      final list = await repository.getregion();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsRegionListGet {
  ParamsRegionListGet();
}
