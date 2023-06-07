import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/region_register/domain/repository/region_register_respository.dart';
import 'package:dartz/dartz.dart';

class RegionRegisterDelete implements UseCase<String, ParamsRegionDelete> {
  final RegionRegisterRepository repository;

  RegionRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsRegionDelete params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsRegionDelete {
  int id;
  ParamsRegionDelete({required this.id});
}
