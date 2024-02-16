import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_average/data/model/region_model.dart';
import 'package:appweb/app/modules/sales_average/domain/repository/respository.dart';
import 'package:dartz/dartz.dart';

class GetRegion implements UseCase<List<RegionModel>, ParamsGetRegion> {
  final Repository repository;

  GetRegion({required this.repository});

  @override
  Future<Either<Failure, List<RegionModel>>> call(
      ParamsGetRegion params) async {
    try {
      final model = await repository.getRegion();
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetRegion {}
