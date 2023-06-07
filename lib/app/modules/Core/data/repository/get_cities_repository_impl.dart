import 'package:appweb/app/modules/Core/data/datasource/get_cities_datasource.dart';
import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_cities_repository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetCitiesRepositoryImpl implements GetCitiesRepository {
  final GetCitiesDatasource datasource;

  GetCitiesRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<CityModel>>> getCities(
      {required int tbStateId}) async {
    try {
      final response = await datasource.getCities(tbStateId);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
