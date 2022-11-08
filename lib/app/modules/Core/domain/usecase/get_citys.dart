import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_cities_respository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCities implements UseCase<List<CityModel>, ParamsGetCity> {
  final GetCitiesRepository repository;

  GetCities({required this.repository});

  @override
  Future<Either<Failure, List<CityModel>>> call(ParamsGetCity params) async {
    try {
      final response = await repository.getCities(tbStateId: params.tbStateId);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetCity {
  final int tbStateId;

  ParamsGetCity({required this.tbStateId});
}
