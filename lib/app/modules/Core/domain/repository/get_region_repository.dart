import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetRegionRepository {
  Future<Either<Failure, List<RegionRegisterModel>>> getregion();
}
