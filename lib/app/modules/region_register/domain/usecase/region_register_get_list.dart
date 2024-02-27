import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/region_register/domain/repository/region_register_respository.dart';
import 'package:dartz/dartz.dart';

class RegionRegisterGetlist
    implements UseCase<List<RegionModel>, ParamsRegionGet> {
  final RegionRegisterRepository repository;

  RegionRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<RegionModel>>> call(
      ParamsRegionGet params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsRegionGet {
  ParamsRegionGet();
}
