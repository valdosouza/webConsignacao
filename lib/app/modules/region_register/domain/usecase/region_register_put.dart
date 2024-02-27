import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/region_register/domain/repository/region_register_respository.dart';
import 'package:dartz/dartz.dart';

class RegionRegisterPut implements UseCase<RegionModel, ParamsRegionPut> {
  final RegionRegisterRepository repository;

  RegionRegisterPut({required this.repository});

  @override
  Future<Either<Failure, RegionModel>> call(ParamsRegionPut params) async {
    try {
      final list = await repository.put(model: params.model);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsRegionPut {
  RegionModel model;
  ParamsRegionPut({required this.model});
}
