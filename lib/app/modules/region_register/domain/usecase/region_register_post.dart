import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/region_register/data/model/region_model.dart';
import 'package:appweb/app/modules/region_register/domain/repository/region_register_respository.dart';
import 'package:dartz/dartz.dart';

class RegionRegisterPost
    implements UseCase<RegionRegisterModel, ParamsRegionPost> {
  final RegionRegisterRepository repository;

  RegionRegisterPost({required this.repository});

  @override
  Future<Either<Failure, RegionRegisterModel>> call(
      ParamsRegionPost params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsRegionPost {
  RegionRegisterModel model;
  ParamsRegionPost({required this.model});
}
