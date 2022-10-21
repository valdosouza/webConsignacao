import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';

class InstitutionGetCity implements UseCase<List<CityModel>, ParamsGetCity> {
  final InstitutionRegisterRespository repository;

  InstitutionGetCity({required this.repository});

  @override
  Future<Either<Failure, List<CityModel>>> call(ParamsGetCity params) async {
    try {
      final response = await repository.getCitys(id: params.id);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetCity {
  final String id;

  ParamsGetCity({required this.id});
}
