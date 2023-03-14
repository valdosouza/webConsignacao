import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class GetCitiesRepository {
  Future<Either<Failure, List<CityModel>>> getCities({required int tbStateId});
}
